Shader "Custom/AdvancedScreenBrighten"
{
    Properties
    {
        _Gamma ("Gamma Curve (伽马提亮)", Range(0.001, 1.0)) = 0.5
        _Saturation ("Saturation (饱和度, 1为原色)", Range(0.0, 1.5)) = 0.75
    }
    SubShader
    {
        Tags { "Queue"="Overlay+500" "RenderType"="Overlay" "IgnoreProjector"="True" }
        LOD 100

        Cull Off 
        ZWrite Off
        ZTest Always

        // 开启硬件 Alpha 混合：Alpha=0 时完全透明，Alpha=1 时完全覆盖
        Blend SrcAlpha OneMinusSrcAlpha

        GrabPass
        {
            "_NVGrabTex"
        }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 grabPos : TEXCOORD0;
                UNITY_VERTEX_OUTPUT_STEREO
            };

            sampler2D _NVGrabTex;
            float _Gamma;
            float _Saturation;

            v2f vert (appdata v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                o.vertex = float4(float2(1, -1) * (v.uv * 2.0 - 1.0), 1.0, 1.0);
                o.grabPos = ComputeGrabScreenPos(o.vertex);
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                float4 grabColor = tex2Dproj(_NVGrabTex, UNITY_PROJ_COORD(i.grabPos));

                // 1. 【纯净原始输入】：获取原始色彩与物理长度
                float3 rawColor = max(0.0, grabColor.rgb);
                float rawLen = length(rawColor);

                // 2. 标量除法提取纯正方向向量（防除以 0）
                float3 colorDir = rawColor / (rawLen + 0.000001); 

                // 3. 【提亮逻辑】：直接归一化并提亮，固化保底亮度 0.003
                float normLen = rawLen / 1.73205;
                float liftedLen = max(0.0, normLen + 0.003); 
                float boostedNormLen = saturate(pow(liftedLen, _Gamma));

                // 4. 用纯正方向还原提亮后的 RGB
                float boostedLen = boostedNormLen * 1.73205;
                float3 boostedRGB = colorDir * boostedLen;

                // 5. 饱和度调节
                float gray = boostedNormLen; 
                float3 finalRGB = lerp(float3(gray, gray, gray), boostedRGB, _Saturation);

                // 6. 提亮后的目标输出 (Alpha 锁死 1.0)
                float4 boostedColor = float4(saturate(finalRGB), 1.0);

                // 7. 【无分支替换 if】：
                // 7.1 累加 RGBA 4 个通道（大于 0.00001 时 mask=1.0，全 0 时 mask=0.0）
                float hasColor = step(0.00001, dot(max(0.0, grabColor), float4(1.0, 1.0, 1.0, 1.0)));

                // 7.2 用 lerp 混合：mask=0 输出 grabColor(全0透传)，mask=1 输出 boostedColor
                return lerp(grabColor, boostedColor, hasColor);
            }
            ENDCG
        }
    }
}
Translation Notice:
	This English version was translated with AI and may contain inaccuracies.

	
Thanks:
	Menu Icon Source 1:
		https://kurone-kito.github.io/launchpad-icons/
		Copyright (c) Kuroné Kito (黒音キト)
		
	Menu Icon Source 2:
		https://dontjinxit.gumroad.com/l/JinxedIcons
		dont_jinxit

		
Description:
	Yuki's Game Light is a VRChat Avatar utility plugin focused on improving the brightness of game world environments.
	
	Through a combination of lighting and image processing, it improves visibility in dark areas and foggy environments while preserving the original colors as much as possible.

	— — Yuki_Tyan

	
Notes:
	This plugin is designed using the Write Defaults Off approach. If you experience abnormal light flickering during use, please check whether the Write Defaults Off settings in the animations related to this plugin have been modified.

	Please do not arbitrarily rename objects within this plugin. The plugin's Animator Controllers rely on the predefined object names and hierarchy. Changing object names may prevent the Animator Controllers from functioning correctly or cause them to stop working entirely.

	You may freely add your own objects, animations, or other features as long as the original object hierarchy and names remain unchanged.

	
Usage:
	Ready to use out of the box.
	Simply drag the prefab under the root of your Avatar. No additional configuration is required.

	
Features:
	Spot Light:
		Uses a cone-shaped light beam to illuminate the area in front of you, making it suitable for increasing brightness directly ahead of the Avatar.

		
	180° Directional Light:
		The brightness of a directional light does not decrease with distance.
		
		Uses 2 directional lights, with their angles adjusted toward the diagonals of a cubic space to cover most directions.
		
		Due to the limited light directions, there will still be a region around the Avatar that cannot be illuminated.


	360° Directional Light:
		Uses 4 directional lights arranged to cover the entire surrounding space, providing illumination from all directions.
		
		Because 4 directional lights are used simultaneously, this may increase the performance cost and can cause lag on some devices or in some environments.


	Fog Reduction:
		Uses image processing to reduce the darkening effect caused by fog, improving brightness while preserving the original colors as much as possible.
		
		This feature processes the screen color using a shader. It first extracts the luminance of the color and applies Gamma brightening, then restores the color based on its original chroma to reduce the grayish or distorted appearance that can occur after brightening.
		
		Note: This feature does not actually remove fog. It only reduces the visual darkening caused by fog, making objects within fog easier to distinguish.


	Fog Gamma:
		Controls the Gamma strength of the Fog Brightening effect.
		
		Higher values produce a stronger brightening effect on darker areas affected by fog.


	Fog Saturation:
		Controls the color saturation after applying Fog Brightening.
		
		Increasing the saturation can reduce the grayish appearance caused by brightening and make colors more vivid and easier to distinguish.
		
		
	Brightness Memory:
		Each of the three lighting modes has its own independent brightness memory.
		
		The Spot Light, 180° Directional Light, and 360° Directional Light each remember their own brightness settings. When switching between lighting modes, the corresponding brightness setting is automatically restored, so you don't need to adjust it again every time.
		
		
	Automatic Hide from Strangers:
		When the light brightness exceeds 10%, Hide from Strangers is automatically enabled.

		At high brightness levels, the light will not be visible to strangers, helping reduce unnecessary visual interference for other players.
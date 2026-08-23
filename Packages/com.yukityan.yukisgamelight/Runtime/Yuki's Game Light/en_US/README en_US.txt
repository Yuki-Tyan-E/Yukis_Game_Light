Credits:
    Menu Icon Source 1:
        https://kurone-kito.github.io/launchpad-icons/
        Copyright (c) Kuroné Kito (黒音キト)
		
    Menu Icon Source 2:
        https://dontjinxit.gumroad.com/l/JinxedIcons
        dont_jinxit

		
Description:
    Yuki's Game Light is a VRChat Avatar feature plugin focused on improving the brightness of game worlds.
	
    Through various combinations of lights and image processing methods, it improves visibility in dark areas and foggy scenes while preserving the original image colors as much as possible.

        — — Yuki_Tyan

		
Notes:
    This plugin is designed based on Write Defaults Off. If abnormal light flickering occurs during use, please check whether the Write Defaults Off settings in the animations related to this plugin have been modified.
	
    Please do not arbitrarily modify the names of objects within this plugin. The plugin's Animator depends on the predefined object names and structure. Arbitrarily modifying object names may cause the Animator to function incorrectly or even become completely unusable.
    
	You may freely add your own objects, animations, or other functions to extend the functionality of this plugin, as long as the original object structure and names are not modified.

	
Instructions:
    Dependency: Modular Avatar
    
	Simply drag the prefab under the Avatar root. No additional configuration is required.

	
Features:
    Spot Light:
        A cone-shaped beam illuminates the area in front, typically used to increase the brightness directly in front of the Avatar.

		
    180° Directional Light:
        The brightness of the directional lights does not decrease with distance.
        
		Consists of 2 directional lights, with their angles adjusted toward the diagonals of a cubic space. This can cover most angles, but there will be a ring of angles that cannot be illuminated.

		
    360° Directional Light:
        Consists of 4 directional lights, with an angle of 120° between each light. This can cover the entire space and provide lighting from all directions. Since 4 directional lights are used simultaneously, it may cause lag in some scenes.

		
    Fog Reduction:
        Processes screen pixels through a shader to reduce the darkening effect caused by fog. It increases brightness while preserving the original colors as much as possible and prevents excessively high brightness from causing glare.

		
    Fog Gamma:
        Controls the Gamma strength of Fog Reduction. The higher the wheel value, the more noticeable the brightening effect.

		
    Fog Saturation:
        Controls the color saturation after Fog Reduction. Increasing the saturation can reduce the grayish-white appearance that may occur after brightening the image, making object colors more vivid and easier to distinguish.

		
    Brightness Memory:
        All three lighting modes have independent brightness memory. When switching between lighting modes, the brightness setting from the previous use is automatically restored.

		
    Brightness Separation:
        Local, Friends Only, and Strangers use three different brightness values in the Blend Tree to avoid excessively affecting other players.
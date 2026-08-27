# Yuki's Game Light

Yuki's Game Light is a VRChat Avatar utility plugin focused on improving the brightness and visibility of game worlds.

It combines multiple lighting setups and shader-based image processing to make dark areas and foggy environments easier to see, while preserving the original colors as much as possible.

<p align="left">
   <a href="https://Yuki-Tyan-E.github.io/Yukis_Game_Light/">
    <img src="https://img.shields.io/badge/VCC%20Listing-Add%20to%20VCC-blue?style=for-the-badge" alt="Add to VCC">
  </a>
</p>

Click the **Add to VCC** button above to add the repository to VRChat Creator Companion, or download the latest package from the Releases page below.

## Installation

Ready to use out of the box.

Simply drag the prefab under the root of your Avatar.

No additional configuration is required.

## Important Notes

This plugin is designed for Write Defaults Off.

If you experience abnormal light flickering while using the plugin, please check whether the Write Defaults Off settings in the animations related to this plugin have been modified.

## Do Not Rename Objects

Please do not arbitrarily rename objects inside this plugin.

The Animator Controllers rely on the predefined object names and hierarchy.

Changing object names may cause animations or features to stop working correctly, or may cause the Animator Controllers to fail completely.

## Features

### Spot Light

A cone-shaped light designed to illuminate the area directly in front of your Avatar.

### 180° Directional Light

Directional Lights do not lose brightness with distance.

The two lights are rotated toward diagonal directions of a cubic space to provide broad coverage.

Because only two light directions are used, there is still a region around the Avatar that cannot be illuminated.

### 360° Directional Light

Uses 4 Directional Lights to provide lighting from all directions around the Avatar.

Using four Directional Lights simultaneously may increase performance cost and can cause frame drops on some devices or in some worlds.

### Fog Reduction

A shader-based image processing feature designed to reduce the darkening effect caused by fog.

It does not actually remove the fog. Instead, it brightens areas that have become dark due to fog, making objects within fog easier to distinguish.

### Brightness Memory

Each of the three lighting modes has its own independent brightness memory.

When switching between lighting modes, the corresponding brightness setting is automatically restored, so you don't need to adjust it again every time.

### Brightness Separation

Local, Friends Only, and Strangers use three different brightness values in the Blend Tree to avoid excessively affecting other players.

## Credits

### Launchpad Icons

[Launchpad Icons](https://kurone-kito.github.io/launchpad-icons/)

Copyright (c) Kuroné Kito (黒音キト)

### Jinxed Icons

[Jinxed Icons](https://dontjinxit.gumroad.com/l/JinxedIcons)

dont_jinxit

## Author

Yuki_Tyan

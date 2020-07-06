# rs2aces_texture_utility
Michael Gochoco © 2020

***rs2aces_texture_utility*** is a Windows command line utility for converting file textures to Redshift ACEScg profile rstexbin sidecar files.

Usage:

Redshift and ACES OCIO must be installed and OCIO environment variables defined.

**rs2aces_texture_utility.exe** ***profile_string*** ***filename***

The following example will convert an sRGB Tiff to an ACEScg rstexbin:

```
rs2aces_texture_utility.exe "Utility - sRGB - Texture" output.tif
// Expected output: output.rstexbin
```

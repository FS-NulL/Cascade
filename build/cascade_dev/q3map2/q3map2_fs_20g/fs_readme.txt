The FS releases of Q3MAP2 are updated versions of Q3MAP2 .16 by Ydnar. This software is licensed under the GPL. Apply the included patch to the SVN version of q3map2 at https://zerowing.idsoftware.com/svn/radiant/GtkRadiant/trunk/ to get a working source code.

q3map2_FS_XX.exe, q3map2_FS_XX.exe.manifest, Microsoft.VC80.CRT.Manifest and the dll's are needed to run.

 --------------------------
 Q3MAP2_FS_3.exe

 Light samples are clipped to the bounds of their source triangle (not quads yet)
    ++This fixes triangle-seam black mark splotching on .ase models, thin brush models, and light leaking through thin joints.

 Supersampling is broke, thats on my todo.  Filter and Bounce still work as intended.

 The PVS test was removed from "contributiontosample" - could make stuff slower for a while.

 "-exposure" was added as a replacement to q3map2 standard light "normalization", uses exponential scaling
   usage: -exposure 60-250
          200 seems like a good starting value.
          Exposure of 1 (default) will force standard q3map2 normalization/clamping            
          Exponential exposure control lets you use ALOT brighter lights in scenes without worrying about oversaturation/clamping
          (dimmer lights will show up better too)
          -- having really good results with no gamma, no compensation, and r_mapoverbrightbits to 0

  --------------------------
  Q3MAP2_FS_4.exe


  "-floodlight" was added.  New ambient lighting replacement.  Defaults are ok but you can change a worldspawn key.
            Note that this WILL bounce light in -bounce stages, so you might want to turn the intensity down.. or it'll get quite bright outside.
         
           "_floodlight" "r g b distance intensity" with red, green blue, and "distance" a sample has to travel to contribute 100%. 
            defaults to 250,250,255, and 1024 distance.  2048 makes occluded rooms darker,  512 makes occluded rooms brighter.
            intensity defaults to 128
         
            example keys:
               _floodlight  1 1 1 512 32  
               _floodlight  1 1 1 1024 64  
               (brighter indoors, less light overall)
               (darker indoors, more light overall)
  --------------------------

  q3map2_fs_5.exe

       - Lightgrid was fixed up so ambient is now 25% of the total light for a given sample.  This was previously broken, so no more mingridlight is required
       - When using -floodlight, the lightgrid takes a bit longer to compile but is sampled versus the floodlighting fairly decently.
           (two floodlight samples are taken, upper and lower hemisphere with "normals" of 0,0,1 and 0,0,-1, and are attributed as directional lights to that point)

  ---------------------------

 q3map2_fs_6.exe

	"-lowquality" flag was added.  Will speed up floodlighting by a factor of 10x or so, should be fairly close to the proper product but noisy.
	- Fixed the black wall issue.
	- bug?: "surfaceparam sky" should be correctly appearing invisible to floodlight checks.. not sure whats up there.  Means you could get dark rooftops.

  ---------------------------

 q3map2_fs_10.exe
	- q3map_lightrgb can now be used to override the light color of surfacelights
	- whole heap of epsillion issues	

  -----------------------------
  q3map2_fs_13.exe
	-  Cleaned up normals for .ase and .md3
	-  .ase SGs supported now
	-  DO NOT USE FILTERRADIUS - I didn't break it but it sure does break things.
 	-  you will probably need to use a finer lightmapscale (0.5 or smaller) to get nice curvature on meshes using sg's

  -----------------------------
  q3map2_fs_14.exe

  -----------------------------
  q3map2_fs_16.exe
	-debugnormals switch in light stages
	-using _floodlight in your worldspawn key turns floodlight on always, same as any other light
 	-turned off filtering for floodlight on ase meshes, which was causing some shading problems. 
           
  -----------------------------
  q3map2_fs_17.exe
	-.ase Mesh face normals were coming in wrong from the file, alot.  Rebuilding them manually at load time now.
		*this effectively broke alot of stuff that depended on them to get good smoothing/lightmapping

  -----------------------------
  q3map2_fs_18.exe
	-Experimental - Autoclipped faces will now try and use quads.
		      - Really ugly meshes might confuse this code.  Works ok on terrain and platonic solids from 3dsmax so far.

  -----------------------------
  q3map2_fs_19.exe
	-undid fs18
		   
  -----------------------------
  q3map2_fs_20.exe
	-Fixes to floodlight  (twosided, not testAll)
	
  -----------------------------
  q3map2_fs_20g.exe
	-Now compiled as 'release' in MS VS2005 instead of 'debug' in MS VS2003 (woekele)


<3, TwentySeven.

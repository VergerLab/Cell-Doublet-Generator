//Requires:
//	- 3D ImageJ Suite Plug-in (https://imagej.net/3D_ImageJ_Suite, Update site: 3D ImageJ Suite)
//	- MorpholibJ Plug-in (https://imagej.net/MorphoLibJ, Update site: IJPB-plugins)

//To use as action tool, place this file in the fiji folder macros/toolsets.
//You can then directly access the action tool on the fiji windows rightmost icon ">>". 

macro "Filled Action Tool - C059 Vw399 V8399" {
//Offset parameter between the cells (in px)
Offset = getNumber("Offset parameter between the cells (in px)", 30);

//Calculate Offset parameters
Offset_Left = 256 - Offset;
Offset_Right = 255 + Offset;

print("Generating cell doublet");
print("[0/4]");

//Hide process
setBatchMode(true);

//Left and right sphere generation 
side = newArray("Left", "Right");
crop = newArray(255, 0);
Off = newArray(Offset_Left, Offset_Right);
for (i = 0; i<side.length; i++){ 
	
	//Generate 8bit sphere (3D ImageJ Suite Plug-in)
	print("[1/4]" + side[i]);
	run("3D Draw Shape", "size=512,512,512 center=" + Off[i] + ",256,256 radius=64,64,64 vector1=1.0,0.0,0.0 vector2=0.0,1.0,0.0 res_xy=1.000 res_z=1.000 unit=unit value=255 display=[New stack]");
	selectWindow("Shape3D");
	rename(side[i]);
	run("8-bit");
	
	//Crop part of the sphere
	print("[2/4]" + side[i]);
	makeRectangle(crop[i], 0, 257, 512);
	setForegroundColor(255, 255, 255);
	run("Fill", "stack");
	run("Invert", "stack");
};

//Merge the spheres
print("[3/4]");
imageCalculator("Add create stack", "Left","Right");
selectWindow("Result of Left");
rename("Filled Cell Doublet");
close("Left");
close("Right");

//Label
print("[4/4]");
run("Connected Components Labeling", "connectivity=6 type=[16 bits]");

//Show
setBatchMode("exit and display");
print("Done!");
};


macro "Empty Action Tool - C059 Ow399 O8399" {
//Offset parameter between the cells (in px)
Offset = getNumber("Offset parameter between the cells (in px)", 30);

//Calculate Offset parameters
Offset_Left = 256 - Offset;
Offset_Right = 255 + Offset;

print("Generating cell doublet");
print("[0/4]");

//Hide process
setBatchMode(true);

//Left and right sphere generation 
side = newArray("Left", "Right");
crop = newArray(256, 0);
Off = newArray(Offset_Left, Offset_Right);
for (i = 0; i<side.length; i++){ 
	print("[1/4]" + side[i]);
	
	//Generate 8bit sphere (3D ImageJ Suite Plug-in)
	print("[1/4]" + side[i]);
	run("3D Draw Shape", "size=512,512,512 center=" + Off[i] + ",256,256 radius=64,64,64 vector1=1.0,0.0,0.0 vector2=0.0,1.0,0.0 res_xy=1.000 res_z=1.000 unit=unit value=255 display=[New stack]");
	selectWindow("Shape3D");
	rename(side[i]);
	run("8-bit");
	

	//Crop part of the sphere
	print("[2/4]" + side[i]);
	makeRectangle(crop[i], 0, 256, 512);
	setForegroundColor(255, 255, 255);
	run("Fill", "stack");
	run("Invert", "stack");

	//Empty inside
	print("[3/4]" + side[i]);
	makeRectangle(0, 0, 512, 512);
	run("Duplicate...", "duplicate");
	run("Erode (3D)", "iso=255");
	run("Erode (3D)", "iso=255");
	imageCalculator("Subtract create stack", side[i], side[i] + "-1");
	close(side[i]);
	close(side[i] + "-1");
};

//Merge the spheres
print("[4/4]");
imageCalculator("Add create stack", "Result of Left","Result of Right");
selectWindow("Result of Result of Left");
rename("Empty Cell Doublet");
close("Result of Left");
close("Result of Right");

//Show
setBatchMode("exit and display");
print("Done!");
};

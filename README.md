# Cell-Doublet-Generator
A simple Fiji macro to make fake cell doublets that can serve as templates for mesh generation prior to FEM mechanical simulation of adherent cell doublet mechanics.

# Installation:
Requires Fiji and the following Fiji plugins

- 3D ImageJ Suite (https://imagej.net/3D_ImageJ_Suite, Update site: 3D ImageJ Suite)
 
- MorpholibJ (https://imagej.net/MorphoLibJ, Update site: IJPB-plugins)

To use as action tool, place the FakeCellDoubletGenerator.ijm file in the fiji folder macros/toolsets.
You can then directly access the action tool on the fiji window rightmost icon ">>".

![Screenshot from 2021-03-06 17-46-50](https://user-images.githubusercontent.com/37848897/110214246-08a99580-7ea4-11eb-86ac-b8952d569836.png)

Tick "FakeCellDoubletGenerator".
The action tools will then be displayed on the Fiji window.

![Screenshot from 2021-03-06 17-47-13](https://user-images.githubusercontent.com/37848897/110214291-3989ca80-7ea4-11eb-9448-c51b25135225.png)


# Output
It generates by default a stack of 512x512x512px containing two partial empty spheres touching or two partial filled and labels sphere with a 2px gap. Each sphere has a 64px radius. when running the macro you can set the offset parameter determining the distance between the center of the spheres (see below).

![Screenshot from 2021-03-06 17-13-12](https://user-images.githubusercontent.com/37848897/110213730-8fa93e80-7ea1-11eb-8ec3-0265b89f8494.png)

Filled label image with 30px offset

![Screenshot from 2021-03-06 17-15-10](https://user-images.githubusercontent.com/37848897/110213732-946df280-7ea1-11eb-84ba-623ed4ee37a7.png)

Filled label image with 0px offset

![Screenshot from 2021-03-06 17-16-37](https://user-images.githubusercontent.com/37848897/110213737-989a1000-7ea1-11eb-9902-f201d65aaaa9.png) ![Screenshot from 2021-03-06 17-38-38](https://user-images.githubusercontent.com/37848897/110213992-cfbcf100-7ea2-11eb-8df1-23314b132b14.png)

Empty binary image with 30px offset


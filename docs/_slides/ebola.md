---
---

## Let's Make the Ebola Model!

- Create a new model in Netlogo File > New
- Right click on View, go to Model Settings and change values to match my settings
- Save model in 'GIS_ebola' folder but not inside any of the other folders.

===

## Define Global Variables

Find the following code at the top of your script to define globals:

```
extensions [ gis csv ]
globals [ sites
		roads
		districts
		SL]
breed [ admin-labels admin-label ]
patches-own [district-name confirmed population road-here]
turtles-own [name status time-infected]
```
{:.text-document title="{{ site.handouts[0] }}"}

What entities will be created from data? What attributes will patches have? Turtles?

===

## Setup Button to Load GIS

- On the interface tab make a button called "setup," then go to code tab
- Right click > choose button> type in setup

===

## Write Code to Load Data

Find the next code block starting with:

```
to setup
	...
```
{:.text-document title="{{ site.handouts[0] }}"}

We need to assign data to our global variables and load the data files.	

===

## Tasks

1. Specify projection file in the 'gis:load-coordinate-system' command.
2. Specify data files assigned to each global variable.

===

## Visualize GIS Layers

Make a button called 'draw,' then go to code tab.

Look at the next code block starting with:

```
to draw
	...
```
{:.text-document title="{{ site.handouts[0] }}"}

What colors are we making sites, districts, and roads? How do we assign roads to specific patches?

===

## Model Extent

What is our model extent now? (Hint: Remember that our roads data is just for Sierra Leone)

===

## Controlling Model Extent

To change model extent, we need to find where it is defined 

- Go back up to the 'setup' code block.

- Comment-out entities with undesired extents to specify our desired extent; in this case, just Sierra Leone.

- Return to the interface, press 'setup' and 'draw.' 

- Green stickies when your model extent aligns with Sierra Leone only.

===

## Labelling Districts

Let's color districts with the Ebola data. We already defined a patch attribute called 'confirmed' that we will use to hold the value for the number of confirmed cases, which we will get from the GIS data for districts.

Use the Command Center to get a feel for the values of 'confirmed'.

Show values for 10 patches, type into the Command Center:

```
ask n-of 10 patches [show confirmed]
```
{:.input}

Or just show the value for a specific patch:

```
ask (patch 1 1) [show confirmed]
```
{:.input}

===

## Color Districts By Confirmed Cases

- In the 'draw' code block, add the code shown in the box, check the code, then click the draw button.

```
gis:apply-coverage districts "V_ADM2_C_3" confirmed
  ask patches
  [ifelse (confirmed > 0)
    [set pcolor scale-color red confirmed 5000 0]
    [set pcolor white]
  ]
```
{:.text-document title="{{ site.handouts[0] }}"}

- Make sure to place the block of code in the same order within the to draw section.

Note: Always color patches first.

===

## A Quick Note About gis:draw

Note that the code 'gis:draw' only adds the GIS data to the display for visual effect. This does not actually apply any attributes to patches or turtles. And turtles and patches cannot interact with the features that are drawn with gis:draw command.

![]({{ site.baseurl }}/images/netlogo_gis_draw.jpeg)

Also note that the red square in the image represents the size of one patch. You can see that the gray line of the boundary and the black line of the road are coarse when inspecting at the patch level - this is just the way Netlogo converts vector data for display. Also note that the detail of these vector GIS features is more detailed than the size of the patch.

===

## Label Each District

Go to the interface tab. Create button called 'load-pop'.

Go to the code block starting with:

```
to load-pop
	...
```
{:.text-document title="{{ site.handouts[0] }}"}

Look at the structure of the loop beginning with the 'foreach' command. See how we can assign labels from our data file with this loop?

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
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

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
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

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
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

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
{:.input title="Console"}

Or just show the value for a specific patch:

```
ask (patch 1 1) [show confirmed]
```
{:.input title="Console"}

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
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

- Make sure to place the block of code in the same order within the to draw section.

Note: Always color patches first.

===

## A Quick Note About gis:draw

Note that the code 'gis:draw' only adds the GIS data to the display for visual effect. This does not actually apply any attributes to patches or turtles. And turtles and patches cannot interact with the features that are drawn with gis:draw command.

![]({% include asset.html path="images/netlogo_gis_draw.jpeg" %})

Also note that the red square in the image represents the size of one patch. You can see that the gray line of the boundary and the black line of the road are coarse when inspecting at the patch level - this is just the way Netlogo converts vector data for display. Also note that the detail of these vector GIS features is more detailed than the size of the patch.

===

## Label Each District

Go to the interface tab. Create button called 'load-pop'.

Go to the code block starting with:

```
to load-pop
	...
```
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

Look at the structure of the loop beginning with the 'foreach' command. See how we can assign labels from our data file with this loop?

===

## What Do We Have So Far?

The model display is showing the spatial extent of the country of Sierra Leone, although the country is not outlined or labeled

- We can see which districts have more confirmed ebola cases. Those with more cases are shown in darker red. Those with fewer cases are shown in lighter shades of pinkish-white.
- The districts are outlined with thick, light gray lines. Each district name is labeled in black.
- The treatment centers are shown as red circles. The road network is shown as thin black lines and they appear to connect most treatment centers.

All this with GIS data freely downloaded and using the Netlogo GIS extension. Although this model is not complete, we have made a nice visual base model upon which to add more data and behavior.

===

## What Story Are We Trying To Tell?

We can see which districts had more confirmed ebola cases, but we don’t know how much of the population in
each district was impacted.

The GIS data we've added thus far only had information about number of people infected with ebola, but we do not know the infect rate relative to total population.

We need to get more data about the population in each district of Sierra Leone.

===

## Population Data

For a quick source of data, go to Wikipedia: [Districts of Sierra Leone](https://en.wikipedia.org/wiki/Districts_of_Sierra_Leone)

You can simply grab this table by highlighting the table contents including headers. 

Copy it, paste it in a spreadsheet, and save as 'SL_pop.csv' in the data folder with your GIS data. (Already done for you.)

===

## Inspect the Data

Open in Excel (or other spreadsheet or text editor program).

Note:

1. Columns of interest are the first ('District') and fifth ('Population') columns.
2. Formatting such as upper/lower/mixed case
3. Size of population is too large for a 1:1 representation with agents in Netlogo

Let’s add agents to model in proportion to population for each district based on the population value stored in the csv file you just saved.

===

## Load CSV file

Go to the 'load-pop' section of the code. Begin with section that starts:

```
file-open "...
```
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

Specify the file name to load. 

Check the code, push the 'load-pop' button.

===

## What Happened?

Look at the CSV file again.

Note how the name of the districts in the GIS data and shown on the display are all upper case, but the name of districts in the CSV data is mixed case. Netlogo does not do fuzzy matching. It must be exactly the same, so let’s add code to fix this.

===

## Fix the Labels

We could fix this in the CSV file, but let’s fix it in Netlogo with some code.

Go back to the 'file-open' code block and make these changes to the second and third lines after the 'while' command:

```
let d_name item 0 row
let district_name upper-case-string d_name
```
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

This change calls a function named 'upper-case-string' to convert the data stored in 'd_name' to be uppercase and store this final version as district_name.

Check the code and green stickies when you've made this change successfully.

===

Go to the bottom of the code. Find the two statements starting with:

```
to-report upper-case-string [s]
	...
```
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

and:

```
to-report uppoer-case-char [c]
	...
```
{:.text-document title="{{ site.data.lesson.handouts[0] }}" .no-eval}

These two functions convert the input to uppercase.

Check the code, and then click the 'load-pop' button.

Green stickies when you've gotten the model to produce agents in proportion to population.

---
---

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
{:.text-document title="{{ site.worksheet[1] }}"}

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
{:.text-document title="{{ site.worksheet[1] }}"}

This change calls a function named 'upper-case-string' to convert the data stored in 'd_name' to be uppercase and store this final version as district_name.

Check the code and green stickies when you've made this change successfully.

===

Go to the bottom of the code. Find the two statements starting with:

```
to-report upper-case-string [s]
	...
```
{:.text-document title="{{ site.worksheet[1] }}"}

and:

```
to-report uppoer-case-char [c]
	...
```
{:.text-document title="{{ site.worksheet[1] }}"}

These two functions convert the input to uppercase.

Check the code, and then click the 'load-pop' button.

Green stickies when you've gotten the model to produce agents in proportion to population.

===

## What Story Are We Trying To Tell?

We now have a nice base model.

We're interested in how Ebola spreads, so we need to model how people move around between infected areas and treatment centers.

===

## Make agents move along roads

Open the Netlogo model 'Extended_ebola_model'

Let's check out the 'go' code blocks.

- subroutine for 'travel'
- right turn and move along roads

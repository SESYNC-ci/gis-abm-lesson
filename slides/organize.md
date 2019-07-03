---
---

## Let's Make a Model!

Overview of Model Process

- Scope topic
- Identify what you need
- Getting/Organizing/Reviewing/Cleaning Data
- Importing data and building a NetLogo model
- Trouble-shooting and test throughout the process
- Validation
- Sharing your model

===

## Scoping the model

- Topic: Ebola
- What is being modeled: spread of ebola, rate of spread
- Experiments: Identify impacts on rate of spread, if restrict travel
- Spatial Scope: Africa > Sierra Leone > district level
- Temporal Scope: Variable
- Agents: People (categories based on SEIR model)
- Environment: (layers we want to show such as with GIS) Admin districts, treatment facilities, roads, cities, airports

===

## A note about this model ...

For this exercise we are only focusing on a sample model to bring in the GIS and CSV data into NetLogo, based on these themes above. We will not actually model the spread of the disease or be able to support the experiments with this base model. However, I encourage you to build upon the model to do this.

See Dr. Andrew Crooks's work on Ebola

- Github: https://github.com/rohan-suri/ebola-abm
- Video: https://youtu.be/IlvnW32uUdg

===

## What data do we need?

- Map data
- Demographic data
- Ebola counts

===

## Reminder about Shapefiles

Shapefiles are actually composed of several component files. At least 4, but up to 8, files that end in the following: .shp, .dbf, .shx, .prj, .sbn, .sbx, .cpg, .xml.

Pro Tip: Try to keep all of these together in the same folder!

===

## Reminder about Tabular Data

Use CSV files for structured data in text format separated by commas.

Viewed in text editor:

```
District,Province,Capital,Area,Population
Kailahun,Eastern,Kailahun,3859,358190
Kenema,Eastern,Kenema,6053,497948
```
{:.text-document title="data/SL_pop.csv"}

View in tabular form:

| District | Province | Capital  | Area | Population |
|----------+----------+----------+------+------------|
| Kailahun | Eastern  | Kailahun | 3859 |     358190 |
| Kenema   | Eastern  | Kenema   | 6053 |     497948 |
| ... |

===

## Where can we find and download GIS data (shp)?

- Various US datasets: http://catalog.data.gov/dataset
- Base level GIS global: https://lib.stanford.edu/GIS/data
- List of sources: http://gisgeography.com/best-free-gis-datasources-raster-vector/
- US Census data: https://www.census.gov/geo/maps-data/data/tiger-data.html
- Global humanitarian datasets: https://data.hdx.rwlabs.org
- Open Street Map and other datasets: WeoGeo Market - Trimble Data Marketplace: http://market.weogeo.com/

===

## Where can we find and download tabular data?

- US Census data: https://www.census.gov/geo/maps-data/data/tiger-data.html
- Global humanitarian datasets: https://data.hdx.rwlabs.org
- Wikipedia: https://en.wikipedia.org/wiki/Districts_of_Sierra_Leone

===

## Data Organization

- Make a folder for this project called 'GIS_ebola'
- If you were starting from scratch, you would make two folders, one called 'source_data' and one called 'data'
- Why two folders?

===

## Review the Data

The dbf file contains the GIS data attributes that you will use in NetLogo.

- Open the .dbf file for "Cases\_at\_Admin2" in excel or open office (do not save!).
- Note the column names of interest for the model (district name, country name, number of confirmed cases), and then close the file but do not save.

Note: may have to refer back to data source to know what column names mean: District name (GLOBAL_A_1), country name (GLOBAL_A_3), and the number of confirmed ebola cases to date (V_ADM2_C3)

===

## Review the Data

Review projection: The .prj file tells us the spatial reference information and projection of the shapefile. Ideally we want all our data in same projection, and lucky for us it is for this exercise.

- Open .prj file in a text editor, review, close, do not save.

- COPY any one of the .prj file and name it 'projection.prj' to make it easy for NetLogo and to have a separate prj file for the model.

- Review spatial extent of data in QGIS, optional.

===

## A Note About GIS Software

ArcGIS/QGIS to View and Process GIS data

QGIS: https://www.qgis.org/en/site/forusers/download.html

QGIS is a free open source GIS software for manipulating and creating geographic data. 
Use to reproject, edit, trim, simplify, and clean datasets for a model. 
Create additional GIS data layers if needed for the model.

===

## Bring Data into NetLogo

- Load data (image, vectors, csv) (tips to make it faster with pixel size and smaller input file via smoothing)
- Make the map: Display, label features (draw features, apply color, label)
- Create agents based on map attributes
- Agent-environment interaction (e.g. movement constrained by map properties - road following, move within state, etc.)
- Saving/Sharing model

===

## NetLogo Extensions

NetLogo Homepage: http://ccl.northwestern.edu/netlogo/

Or, in NetLogo, go to Help > NetLogo User Manual

===

## NetLogo and GIS

A great reference for working with GIS data in NetLogo is the model in the model library:

- Open NetLogo > Models Library > Code Examples > GIS > GIS General Examples
- Click setup (to load the GIS)
- Click display-countries
- display-population-in-patches
- Go to code tab (notice extensions at top, setup commands, good commenting throughout).

Note: You can use this model to copy and adapt code sections for your own models.

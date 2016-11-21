---
---

## Quick reminder: GIS data types and formats

Using the GIS extension, you can use geographic data that is vector format as shapefiles or raster data as ASCII and .tif.

Vector datasets (shapefiles): For example, cities as points, roads as lines, buildings as polygons

Raster datasets (ASCII, .tif): For example, elevation data or remote sensing imagery

===

## Using GIS with ABMs: Benefits

- Support more “realistic” models and tie model to a specific place
- GIS data can provide attributes that can be used by patches and agents that would be too time consuming to manually code
- Can be more visually appealing with layers of information displayed in Netlogo
- It is not challenging to add GIS and CSV data to Netlogo

===

## Using GIS with ABMs: Costs

- Need realistic agent behavior to correspond with spatial scale of model with GIS
- Scale matters. At detailed map scale, challenge to get spatial reference system to match Netlogo reference such that 10 km = distance of 1 patch, for example.
- GIS data may slow down model load time and run time
- GIS and data acquisition/cleaning/processing may be time intensive and require tools like QGIS and Open Office

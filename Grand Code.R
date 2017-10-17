library(raster)
library(rgdal)
library(rasterVis)
setwd("C:/Users/Alexis Glenn/Desktop/Datasets/Population Dataset/WorldPop Dataverse/Other Data Layers")

# boundary for Southeast Asia
SEAbound <- c(90, 150, -15, 30)

# classifier by country and global region
countryID <- raster("mastergrid_countrycodeID_1km.tif")
region <- read.csv("ISO Regional Classification.csv")
labeling <- region[,c("country.code", "sub.region.code")]
#labeling[,2] <- as.factor(labeling[,2])
regionalID <- reclassify(countryID, rcl=labeling)
regionalID <- as.factor(regionalID)
rat <- levels(regionalID)[[1]]
rat[["region"]] <- letters[1:24]
levels(regionalID) <- rat
#writeRaster(regionalID, filaname="regionalID_1km.tif", format="GTiff")
#areaID <- stack(countryID, regionalID)
library(randomcoloR)
palette <- distinctColorPalette(24)
levelplot(regionalID, col.regions=palette)
#regionalID <- ratify(regionalID)
#deal with the plots later
for (region in levels(multilayer)[[1]]) {
  freq(r, value=region)
} # how to correct for difference of pixel and land area for those away from the equator


# topography data resampled to 1km resolution
topo <- raster("mastergrid_topography_1km.tif")
topo
plot(topo)
hist(topo, maxpixels=10000)
table(topo==1)

# landcover data - specify for Southeast Asia
landcover <- raster("mastergrid_globcover2009_1km.tif")
GLClegend <- read.csv("Globcover2009_Legend.csv")
GLClegend[["Hex"]] <- paste("#", GLClegend[["Hex"]])
coloring <- GLClegend[["Hex"]]
plot(landcover, col=coloring)

SEA <- crop(landcover,SEAbound)
plot(SEA, col=coloring)   # color the NoData value blue

#add layering of topography and population and regional codes
#summarize by region if below a certain elevation and 


plot(SoutheastAsia)
plot(SoutheastAsia, main="Population of Southeast Asia", legend=FALSE, axes=FALSE, zlim=c(0,6.5))
object.size(c(log_pop, population, SoutheastAsia))
loadhistory("C:/Users/Alexis Glenn/Desktop/Datasets/Population Dataset/WolrdPop Dataverse/cropping.Rhistory")
setwd("C:/Users/Alexis Glenn/Desktop/Datasets/Population Dataset/WolrdPop Dataverse/Other Data Layers")
landcover <- raster("mastergrid_globcover2009_1km.tif")
library(raster)
landcover <- raster("mastergrid_globcover2009_1km.tif")
landcover
values(landcover)


population <- raster("gpw-v4-population-density_2015.tif")
population
log_pop <- log10(population)
plot(log_pop)
SoutheastAsia <- crop(log_pop, c(90, 150, -10, 30))
SoutheastAsia
plot(SoutheastAsia)

#final East Asia plotting
par(mar=c(0,0,0,0))
plot(EastAsiamap('worldHires', add=TRUE,xlim=c(60.50792,96.99958), ylim=c(4.999584, 30))
text(x=cities$x.coords, y=cities$y.coords, labels=cities$ï..names, pos=1)
plot(log2015, col=rainbow(100, start=2/6, end=4/6), legend=FALSE, box=FALSE, axes=FALSE)
, legend=FALSE, box=FALSE, axes=FALSE)
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="lightblue")
lot(EastAsia$logElev, col=c("red", terrain.colors(100)), legend=FALSE, box=FALSE, axes=FALSE, add=TRUE)
par(font=2)
points(x=cities$x.coords, y=cities$y.coords, pch=16)
text(x=cities$x.coords, y=cities$y.coords, labels=cities$ï.., pos=1)
rect(c(116,117.5,139.285), c(36.5, 29.5,35.055), c(119,122,140.193), c(40.5,32.75, 36.005), lwd=3.5)
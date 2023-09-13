# Load the required packages
# Install missing packages if needed
# install.packages("raster")
# install.packages("sf")
# install.packages("rnaturalearth")
# install.packages("tidyverse")
# install.packages("leaflet")
# install.packages("gapminder")

library(raster)
library(sf)
library(rnaturalearth)
library(tidyverse)
library(leaflet)
library(gapminder)

irchel <- st_as_sf(data.frame(
  long = 8.549403, lat = 47.396653),
  coords = c("long", "lat"), crs = 4326)

content <- "You have successfully installed R and RStudio! See you soon at GEO 812!"

# Create the leaflet map

m <- leaflet() %>%
  addTiles() %>%
  addCircleMarkers(data = irchel, radius = 10,
                   opacity = 0.3, popup = content)

m
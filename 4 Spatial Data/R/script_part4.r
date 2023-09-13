# Session 4: Spatial Data


library(sf)
cities <- data.frame(name = c("Lausanne", "Berlin"),
                     lon = c(6.63, 13.41),
                     lat = c(46.52, 52.52))
cities_sf <- st_as_sf(cities, 
                      coords = c("lon", "lat"), crs = 4326)

library(rnaturalearth)
world_sf <- ne_countries(scale = "medium", returnclass = "sf")

switzerland_sf <- world_sf %>%
  filter(name == "Switzerland")

st_transform(switzerland_sf, crs = 2056) 

st_contains(switzerland_sf, cities_sf, sparse = FALSE)

st_distance(cities_sf)

switzerstein_sf <- st_union(switzerland_sf,
                            world_sf %>% filter(name == "Liechtenstein"))


ggplot() +
  geom_sf(data = world_sf %>% filter(name == "Germany")) +
  geom_sf(data = switzerland_sf) +
  geom_sf(data = cities_sf) +
  geom_sf_label(data = cities_sf, aes(label = name), size = 2) +
  coord_sf(crs = 3035) +
  theme_void()

cities_sp <- as(cities_sf, "Spatial")
st_as_sf(cities_sp)

library(raster)
dem_ch <- getData('alt', country='CH', mask=TRUE)
dem_de <- getData('alt', country='DE', mask=TRUE)
dem <- merge(dem_ch, dem_de)
names(dem)  <- names(dem_de) <- names(dem_ch) <- "altitude"

dem_df <- as.data.frame(dem, xy = T)
ggplot(dem_df) +  
  geom_raster(aes(x = x, y = y, fill = altitude)) +
  scale_fill_viridis_c(na.value = "white") +
  coord_quickmap() + theme_void()



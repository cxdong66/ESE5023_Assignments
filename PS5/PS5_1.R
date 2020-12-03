library("sp")
library("sf")
library("rgdal")
library("raster")

setwd("I:/ESE5023/raster")
#1
srad_1 <- raster("wc2.1_2.5m_srad_01.tif")
srad_2 <- raster("wc2.1_2.5m_srad_02.tif")
srad_3 <- raster("wc2.1_2.5m_srad_03.tif")
srad_4 <- raster("wc2.1_2.5m_srad_04.tif")
srad_5 <- raster("wc2.1_2.5m_srad_05.tif")
srad_6 <- raster("wc2.1_2.5m_srad_06.tif")
srad_7 <- raster("wc2.1_2.5m_srad_07.tif")
srad_8 <- raster("wc2.1_2.5m_srad_08.tif")
srad_9 <- raster("wc2.1_2.5m_srad_09.tif")
srad_10 <- raster("wc2.1_2.5m_srad_10.tif")
srad_11 <- raster("wc2.1_2.5m_srad_11.tif")
srad_12 <- raster("wc2.1_2.5m_srad_12.tif")

srad_avg <-(srad_1+srad_2+srad_3+srad_4+srad_5+srad_6+srad_7+srad_8+
                srad_9+srad_10+srad_11+srad_12)/12

prec_1 <- raster("wc2.1_2.5m_prec_01.tif")
prec_2 <- raster("wc2.1_2.5m_prec_02.tif")
prec_3 <- raster("wc2.1_2.5m_prec_03.tif")
prec_4 <- raster("wc2.1_2.5m_prec_04.tif")
prec_5 <- raster("wc2.1_2.5m_prec_05.tif")
prec_6 <- raster("wc2.1_2.5m_prec_06.tif")
prec_7 <- raster("wc2.1_2.5m_prec_07.tif")
prec_8 <- raster("wc2.1_2.5m_prec_08.tif")
prec_9 <- raster("wc2.1_2.5m_prec_09.tif")
prec_10 <- raster("wc2.1_2.5m_prec_10.tif")
prec_11 <- raster("wc2.1_2.5m_prec_11.tif")
prec_12 <- raster("wc2.1_2.5m_prec_12.tif")

prec_avg <-(prec_1+prec_2+prec_3+prec_4+prec_5+prec_6+prec_7+prec_8+
               prec_9+prec_10+prec_11+prec_12)/12

wind_1 <- raster("wc2.1_2.5m_wind_01.tif")
wind_2 <- raster("wc2.1_2.5m_wind_02.tif")
wind_3 <- raster("wc2.1_2.5m_wind_03.tif")
wind_4 <- raster("wc2.1_2.5m_wind_04.tif")
wind_5 <- raster("wc2.1_2.5m_wind_05.tif")
wind_6 <- raster("wc2.1_2.5m_wind_06.tif")
wind_7 <- raster("wc2.1_2.5m_wind_07.tif")
wind_8 <- raster("wc2.1_2.5m_wind_08.tif")
wind_9 <- raster("wc2.1_2.5m_wind_09.tif")
wind_10 <- raster("wc2.1_2.5m_wind_10.tif")
wind_11 <- raster("wc2.1_2.5m_wind_11.tif")
wind_12 <- raster("wc2.1_2.5m_wind_12.tif")

wind_avg <-(wind_1+wind_2+wind_3+wind_4+wind_5+wind_6+wind_7+wind_8+
              wind_9+wind_10+wind_11+wind_12)/12

China <- readOGR("I:/ESE5023/China_map", "bou2_4p")

#2
srad_China <- crop(srad_avg,China)
srad_China <- mask(srad_China,China,na.rm=T)
plot(srad_China,main="Solar Radiation in China", col=terrain.colors(40))

prec_China <- crop(prec_avg,China)
prec_China <- mask(prec_China,China,na.rm=T)
plot(prec_China,main="Precipitation in China", col=terrain.colors(10))

wind_China <- crop(wind_avg,China)
wind_China <- mask(wind_China,China,na.rm=T)
plot(wind_China,main="Wind Speed in China", col=terrain.colors(40))


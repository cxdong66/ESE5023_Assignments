library(tidyr)
library(dplyr)
library(ggplot2)
library(zoo)
WindSpeed <- read.csv(file = "2281305.csv", header = T)
WindSpeedtb <- as_tibble(WindSpeed)
#clean the data
WND1<- WindSpeedtb %>% 
        filter(substr(WND,1,3)!=999) %>% 
        select(WND) %>% 
        pull

#check the direction quality code
unique(substr(WND1,5,5))
#check the type code
unique(substr(WND1,7,7))
#check the speed rate
unique(substr(WND1,9,12))
range(as.numeric((substr(WND1,9,12))))
#check the speed quality code
unique(substr(WND1,14,14))

#Plot monthly averaged wind speed as a function of the observation time.

DATE1 <- WindSpeedtb$DATE
DATE2 <- as.Date(DATE1,"%Y-%m-%d")

DATE_X <- as.yearmon(
  WindSpeedtb %>% 
  mutate(DATE3 = substr(DATE2,1,7)) %>% 
  filter(substr(WND,1,3)!=999) %>% 
  select(DATE3) %>% 
  unique() %>% 
  pull
) 
 
WindSpeedtb %>% 
  mutate(DATE3 = substr(DATE2,1,7)) %>% 
  filter(substr(WND,1,3)!=999) %>% 
  group_by(DATE3) %>% 
  summarise(MONTHLYMEAN = mean(as.numeric(substr(WND,9,12)))) %>% 
  ggplot(aes(x=DATE_X,y=MONTHLYMEAN),)+
  geom_line()
  


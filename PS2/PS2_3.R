library(tidyr)
library(dplyr)
library(ggplot2)

Water_Data <- read.csv("marine_water_quality.csv")
Water_Data_tbl <- as_tibble(Water_Data)

Water_Data_tbl %>% 
  filter(Turbidity..NTU. != 'N/A') %>% 
  mutate(DATE = as.Date(Dates)) %>% 
  ggplot(aes(x = DATE, y = as.numeric(Turbidity..NTU.)))+
  geom_line()


           
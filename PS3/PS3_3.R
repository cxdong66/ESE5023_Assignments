library(tidyr)
library(dplyr)
library(ggplot2)

PregnantData <- read.csv("Pregnant_Zinc.csv")
PD_tbl <- as_tibble(PregnantData)

PD_tbl %>% 
  group_by(TYPE) %>% 
  summarise(Zinc_mean = mean(ZINC),
            Zinc_sd = sd(ZINC))

Anova_Zinc <- aov(ZINC ~ TYPE, data = PD_tbl)
summary(Anova_Zinc)
TukeyHSD(Anova_Zinc)

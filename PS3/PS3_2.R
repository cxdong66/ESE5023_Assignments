library(tidyr)
library(dplyr)
library(ggplot2)

BoneData <- read.csv("Bone.csv",header = T)
BD_tbl <- as_tibble(BoneData)
BD_tbl %>% 
  group_by(BONE) %>% 
  summarise(OIC_mean = mean(OIC))
hist(BD_tbl$OIC)

anova_one_way <- aov(OIC ~ BONE, data = BD_tbl)
summary(anova_one_way)
TukeyHSD(anova_one_way)
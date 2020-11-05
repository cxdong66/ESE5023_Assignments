library(tidyr)
library(dplyr)
library(ggplot2)

BigBang <- read.csv("Big Bang.csv",header = T)
BB_tbl <- as_tibble(BigBang)
#1
BB_tbl %>% 
  ggplot(aes(x=Velocity,y=Distance))+
  geom_point()+
  
#2  
  geom_smooth(method = lm,formula = y ~ x,se = F)

#3
model_1 <- lm(Distance ~ Velocity-1,data = BigBang)
print(model_1)
summary(model_1)

#4The data we got now is not precise enough, like there are 4 points has the same velocity, 
#but the distance is not same,which make the regression lower or higher than the truth


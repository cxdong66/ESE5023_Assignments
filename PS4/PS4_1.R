library(ggplot2)
data(CO2)

#1 Boxplot

CO2_tbl <- as_tibble(CO2)
CO2_tbl %>% 
  group_by(Plant) %>% 
  ggplot(aes( x=Plant,y=uptake ))+
  geom_boxplot()+
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  ggtitle("Boxplot with jitter for CO2 Uptake of 12 Plants ") +
  xlab("Plant")

#2 Time series
KeelingData <- read.csv("co2_mm_mlo.csv",header = T)
KD_tbl <- as_tibble(KeelingData)
KD_tbl1 <-KD_tbl %>% 
  filter(quality == 1) %>% 
  group_by(year) %>% 
  summarise(co2_mean = mean(co2))

KD_tbl1 %>% 
  ggplot(aes(x=year,y=co2_mean))+
  geom_line()+
  theme_bw()+
  labs( x = "Year", y = "CO2",
        title ="CO2 by Year",
        subtitle = "Monthly average"
        ) 

#3 Histogram
data(rivers)
LofRivers <- as_tibble(rivers)
ggplot(LofRivers,aes(x=value))+
  geom_histogram()+
  theme_bw()+
  labs( x = "Length of Rivers",y = "Count",
        title ="Histogram for Length of Rivers",
        subtitle = "In North America"
  ) 

#4 Scatter plot
#请教了蒋浩同学
data(iris)
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 1.0, shape = 16) +
  facet_wrap( ~ Species) +
  labs(title="Sepal.Length ~ Sepal.Width")

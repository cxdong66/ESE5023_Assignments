BaoAN <- read.csv("2281305.csv",header = T)

library(tidyr) 
library(dplyr) 
library(ggplot2)
library(forecast)

#2.1
BaoAn_tbl <- as_tibble(BaoAN)
#Clean the data
BaoAn_TMP <- BaoAn_tbl %>% 
  select(DATE,TMP) %>% 
  filter(substr(TMP,1,5) != "+9999") %>% 
  mutate(TMP1 = as.numeric(substr(TMP,1,5))) %>% 
  mutate(DATE1 = as.Date(DATE)) %>% 
  mutate(MONTH = substr(DATE1,1,7)) %>%
  group_by(MONTH) %>% 
  summarise(MONTH_AVG = mean(TMP1)) 

BaoAn_TMP1 <- BaoAn_TMP %>%
  filter(MONTH_AVG != "2020-09")
  
#Construct a time series
TMP_ts <- ts(BaoAn_TMP1$MONTH_AVG, start=c(2010,1),end = c(2020,08) ,frequency=12)
plot(TMP_ts)

#2.2
TMP_D <- decompose(TMP_ts)
plot(TMP_D)
Box.test(TMP_D$random,type = "Ljung")

#2.3
TMP_diff <- diff(TMP_ts)
plot(TMP_diff)
acf(TMP_ts)
pacf(TMP_ts)
model <- auto.arima(TMP_ts)
summary(model)

#2.4

TMP_Forecast <- forecast(model, 2)
plot(TMP_Forecast)

TMP_Forecast$mean[1]
TMP_Forecast$lower[1]
TMP_Forecast$upper[1]

TMP_Forecast$mean[2]
TMP_Forecast$lower[2]
TMP_Forecast$upper[2]

tail(BaoAn_TMP)

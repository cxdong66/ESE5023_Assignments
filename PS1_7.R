Water_Data <- read.csv("marine_water_quality.csv")
#This file is from 蒋浩, who also use it for the assignment.
#In this problem, I want to analyze the turbidity (NTU) of this site

#7.1 Clean the data
Water_NTU <- Water_Data$Turbidity..NTU.
Water_NTU[which(Water_NTU == 'N/A')] <- NA
Water_NTU <- as.numeric(Water_NTU)

#7.2
Water_date <- as.Date(Water_Data$Dates)
plot(Water_date,Water_NTU,lwd=1, type = "l", col="blue")

#7.3
max(Water_NTU, na.rm = TRUE)
min(Water_NTU, na.rm = TRUE)
mean(Water_NTU, na.rm = TRUE)
var(Water_NTU, na.rm = TRUE)
quantile(Water_NTU, na.rm = TRUE)

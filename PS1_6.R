#6.1
#Read the data
Raw_Data <- read.csv(file = "2281305.csv", header = T)
Shenzhen_VIS <- Raw_Data$VIS

#Clean the data
Shenzhen_VIS_value <- as.numeric(substr(Shenzhen_VIS,1,6))
Shenzhen_VIS_DQC <- substr(Shenzhen_VIS,8,8)
Shenzhen_VIS_VC <- substr(Shenzhen_VIS,10,10)
Shenzhen_VIS_QVC <- substr(Shenzhen_VIS,12,12)

Shenzhen_VIS2 <- Shenzhen_VIS
Shenzhen_VIS_value[which(Shenzhen_VIS_value == 999999)] <- NA
#According to the "user guide", when the date is not missing, meanwhile the DQC or QVC equals 9, the data is still useful.
#So I disable the following lines.
#Shenzhen_VIS_value[which(Shenzhen_VIS_DQC != '1')] <- NA
#Shenzhen_VIS_value[which(Shenzhen_VIS_VC != 'N')] <- NA
#Shenzhen_VIS_value[which(Shenzhen_VIS_QVC != '1')] <- NA

#plot
Obs_Time <- as.Date(Raw_Data$DATE)
max(Shenzhen_VIS_value,na.rm = T)
plot(Obs_Time, Shenzhen_VIS_value, lwd=0.01, type = "l", col="blue")


#6.2
#Import the date(perday)
Shenzhen_VIS_Day <- unique(Obs_Time)
#Numerical
Shenzhen_VIS_Day1 <- as.numeric(format(Shenzhen_VIS_Day, "%Y%m%d"))
#Create the list max values of VIS per day
SHenzhen_VIS_MaxPerDay <- list()
#the i in for() must be numerical, so I did a series of transformation of i. :)
for(i in Shenzhen_VIS_Day1){
  SHenzhen_VIS_MaxPerDay <- c(SHenzhen_VIS_MaxPerDay , max(Shenzhen_VIS_value[which(Obs_Time == as.Date(as.character(i),"%Y%m%d"))],na.rm = T))
}
#plot the max value per day
dev.new()
plot(Shenzhen_VIS_Day, SHenzhen_VIS_MaxPerDay, lwd=1, type = "l", col="blue")

#Report the number of days with visibility by plot the histograms 
Year <- as.numeric(substr(Shenzhen_VIS_Day,1,4))
dev.new()
par(mfrow=c(2,5),new = TRUE) 
for(i in 2010:2020){
  hist(as.numeric(SHenzhen_VIS_MaxPerDay[which(Year == i)]),breaks = c(0,5000,10000,15000,20000,25000,30000), right = FALSE, labels = TRUE,main = NA, xlab = "VIS Value",ylab = "Frequncy")
  title("The VIS Histogram", sub = i)
}
#The visibility is getting better, except the 2020.
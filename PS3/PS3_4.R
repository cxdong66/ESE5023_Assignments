
ALR <- read.csv("ALR.csv",header = T)

plot(ALR$Temp ~ ALR$Elevation )

lm(ALR$Temp ~ ALR$Elevation )

#plot1.R 
#To generate Global Active Power plot
setwd("C:\\LEARN\\DataScience_JH")
Alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
#First Two days in Feb data 
DataForFebFirstTwodays<-subset(Alldata,Date %in% c("2/1/2007","2/2/2007"))
par(mar=c(4,4,2,2))
hist(DataForFebFirstTwodays$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off() 
#Done 
 
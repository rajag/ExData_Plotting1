#Plot4 
Alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
DataForFebFirstTwodays <- subset(Alldata,Date %in% c("1/2/2007","2/2/2007"))
library(reshape2)
reshapedata <- melt(DataForFebFirstTwodays,id=c("Date","Time"),measure.vars=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
x <- as.POSIXlt(paste(DataForFebFirstTwodays$Date, DataForFebFirstTwodays$Time), format="%d/%m/%Y %H:%M:%S")
z <- as.POSIXlt(paste(reshapedata$Date, reshapedata$Time), format="%d/%m/%Y %H:%M:%S")
y <- reshapedata$value
par(mar=c(4,4,2,2))
par(mfrow=c(2,2))
with(DataForFebFirstTwodays,{
    plot(x,DataForFebFirstTwodays$Global_active_power, type ="l",xlab="",ylab="Global Active Power",main="")
    plot(x,DataForFebFirstTwodays$Voltage, type ="l",xlab="Datetime",ylab="Voltage",main="")
    with(reshapedata,plot(z,value, type ="l",xlab="",ylab="Energy sub metering",main=""))
    with(subset(reshapedata,variable == "Sub_metering_1"),lines(z,y,col="black"))
    with(subset(reshapedata,variable == "Sub_metering_2"),lines(z,y,col="red"))
    with(subset(reshapedata,variable == "Sub_metering_3"),lines(z,y,col="blue"))
    legend("topright",pch="-",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    plot(x,DataForFebFirstTwodays$Global_reactive_power, type ="l",xlab="Datetime",ylab="Global_reactive_power",main="")
})
dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()


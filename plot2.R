Alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
DataForFebFirstTwodays <- subset(Alldata,Date %in% c("1/2/2007","2/2/2007"))
x <- as.POSIXlt(paste(DataForFebFirstTwodays$Date, DataForFebFirstTwodays$Time), format="%d/%m/%Y %H:%M:%S")
y <- DataForFebFirstTwodays$Global_active_power
par(mar=c(2,4,2,2))
plot(x,y, type ="l",xlab="",ylab="Global Active Power (kilowatts)",main="")
dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()
 
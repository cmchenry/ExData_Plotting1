## Read data file
fileName <- "household_power_consumption.txt"
powerDf <- read.csv(fileName, sep = ";", na.strings="?")
powerDf$DateTime <- strptime(paste(powerDf$Date, powerDf$Time), "%d/%m/%Y %H:%M") 

## Filter Data Frame to data between 2/1/2007 and 2/2/2007
startDate <- as.POSIXlt("2007-02-01")
endDate <- as.POSIXlt("2007-02-03")
filteredPowerDf <- powerDf[powerDf$DateTime >= startDate & powerDf$DateTime < endDate,]

## Open the png Graphics device
png(filename = "plot3.png", width=480, height=480)

## Draw the line of the Sub Metering by Date and Time
plot(x=filteredPowerDf$DateTime, 
     y=filteredPowerDf$Sub_metering_1, 
     type="l", 
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     xaxs="r")
points(x=filteredPowerDf$DateTime, 
       y=filteredPowerDf$Sub_metering_2, 
       type="l", 
       col="red")
points(x=filteredPowerDf$DateTime, 
       y=filteredPowerDf$Sub_metering_3, 
       type="l", 
       col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), 
       lwd=c(1.0, 1.0, 1.0),
       col=c("black", "red", "blue"))

dev.off()
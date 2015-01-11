## Read data file
fileName <- "household_power_consumption.txt"
powerDf <- read.csv(fileName, sep = ";", na.strings="?")
powerDf$DateTime <- strptime(paste(powerDf$Date, powerDf$Time), "%d/%m/%Y %H:%M") 

## Filter Data Frame to data between 2/1/2007 and 2/2/2007
startDate <- as.POSIXlt("2007-02-01")
endDate <- as.POSIXlt("2007-02-03")
filteredPowerDf <- powerDf[powerDf$DateTime >= startDate & powerDf$DateTime < endDate,]

## Open the png Graphics device
png(filename = "plot2.png", width=480, height=480)

## Draw the line plot of the Global Active Power by Date and Time
plot(x=filteredPowerDf$DateTime, 
     y=filteredPowerDf$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     xaxs="r")

dev.off()


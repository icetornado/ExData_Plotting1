## get data from raw file
headers <- names(read.csv("household_power_consumption.txt", sep=";", nrows=1))
rawData <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if (($1 == \"1/2/2007\") || ($1 == \"2/2/2007\")) print $0}' household_power_consumption.txt"), header = FALSE, col.names = headers, sep = ";", colClasses = "character")

## setting plot params
par(family = "sans", mar = c(5,7,4,2), mfrow = c(2,2))

# graph 1
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", ylab = "Global Active Power", xlab=""))

#graph 2
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Voltage, type="l", ylab = "voltage", xlab="datetime"))

#graph 3 
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="n", ylab = "Energy sub metering", xlab=""))
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_1, col = "black")
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_2, col="red")
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_3, type="l", col="blue", ylab = "Energy sub metering", xlab="")
legend("top", pch = 95, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1, cex=0.5, bty = "n")

#graph 4
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Global_reactive_power, type="l", ylab = "voltage", xlab="datetime"))

dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

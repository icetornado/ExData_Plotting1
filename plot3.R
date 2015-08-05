## get data from raw file
headers <- names(read.csv("household_power_consumption.txt", sep=";", nrows=1))
rawData <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if (($1 == \"1/2/2007\") || ($1 == \"2/2/2007\")) print $0}' household_power_consumption.txt"), header = FALSE, col.names = headers, sep = ";", colClasses = "character")

## setting plot params
par(family = "sans", mar = c(5,7,4,2))

##plot 3
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Sub_metering_1, type="n", ylab = "Energy sub metering", xlab=""))
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_1, col = "black")
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_2, col="red")
lines(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), rawData$Sub_metering_3, type="l", col="blue", ylab = "Energy sub metering", xlab="")
legend("top", pch = 95, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pt.cex=1, cex=0.5)

dev.copy(png, file="figure/plot3.png", width = 480, height = 480)
dev.off()
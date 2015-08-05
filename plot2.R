## get data from raw file
headers <- names(read.csv("household_power_consumption.txt", sep=";", nrows=1))
rawData <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if (($1 == \"1/2/2007\") || ($1 == \"2/2/2007\")) print $0}' household_power_consumption.txt"), header = FALSE, col.names = headers, sep = ";", colClasses = "character")

## setting plot params
par(family = "sans", mar = c(5,7,4,2))

## line graph
with(rawData, plot(strptime(paste(rawData$Date, rawData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"), Global_active_power, type="l", ylab = "Global Active Power (killowatts)", xlab=""))
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()
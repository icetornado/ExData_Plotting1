## get data from raw file
headers <- names(read.csv("household_power_consumption.txt", sep=";", nrows=1))
rawData <- read.csv(pipe("awk 'BEGIN {FS=\";\"} {if (($1 == \"1/2/2007\") || ($1 == \"2/2/2007\")) print $0}' household_power_consumption.txt"), header = FALSE, col.names = headers, sep = ";", colClasses = "character")

## setting plot params
par(family = "sans", mar = c(5,7,4,2))

## plotting histogram of Global Active Power
hist(as.numeric(rawData$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

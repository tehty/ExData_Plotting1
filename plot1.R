## First, loading the data with string, string and 7 numeric field

filename <- "./data/household_power_consumption.txt"
data <- read.table(filename, header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Then, to extract only 2 days data - 1 -2 Feb 2007

DataSet_Feb2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Then, get the global Active Power data

globalActivePower <- DataSet_Feb2007$Global_active_power

## Graphics devices for JPEG, PNG or TIFF format bitmap files. 

png("plot1.png", width=480, height=480)

## Computes a histogram of the given global active data with red color

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()



## The top few lines can be put into single R file for loading data, 
## to extract 2 days subset data - 2/2/2007 and combine datetime
## 

filename <- "./data/household_power_consumption.txt"
data <- read.table(filename, header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Then, to extract only 2 days data - 1 -2 Feb 2007

DataSet_Feb2007 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## combine to get datetime data

DateTime <- strptime(paste(DataSet_Feb2007$Date, DataSet_Feb2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Get submetering1, submetering2, submetering3 data from the 2 days dataset

subMetering1 <- DataSet_Feb2007$Sub_metering_1
subMetering2 <- DataSet_Feb2007$Sub_metering_2
subMetering3 <- DataSet_Feb2007$Sub_metering_3

## Graphics devices for JPEG, PNG or TIFF format bitmap files.

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

## Line type of plot will be drawn for submetering

plot(DateTime, subMetering1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")

## The lines( ) function adds submetering2 and submetering 2 information to line chart. I

lines(DateTime, subMetering2, col = "red")
lines(DateTime, subMetering3, col = "blue")

## Adding legend to the plot - which will be at top right corner
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
##  shuts down the specified (by default the current) device
dev.off()
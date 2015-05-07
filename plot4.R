## The top few lines can be put into single R file for loading data, 
## to extract 2 days subset data - 2/2/2007, combine datetime,
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

## Graphics devices for JPEG, PNG or TIFF format bitmap files.

png(filename = "plot4.png", 
    width = 480, height = 480)

## Creating and Controlling Multiple Screens on a Single Device 
## In a layout with exactly two rows and columns 

par(mfrow = c(2, 2))

## Top-left screens - Global active power
plot(DateTime, DataSet_Feb2007$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Top-right screen - Voltage data
plot(DateTime, DataSet_Feb2007$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Bottom-left - Submetering data
plot(DateTime, DataSet_Feb2007$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, DataSet_Feb2007$Sub_metering_2, col = "red")
lines(DateTime, DataSet_Feb2007$Sub_metering_3, col = "blue")

## Add legend without the border: bty= n (box to be drawn around the legend)
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right - Global reactive power
plot(DateTime, DataSet_Feb2007$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off()

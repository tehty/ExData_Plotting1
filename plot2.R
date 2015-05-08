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

## Then, get the global Active Power data

globalActivePower <- DataSet_Feb2007$Global_active_power

## Graphics devices for JPEG, PNG or TIFF format bitmap files. 

png(filename = "plot2.png",  width = 480, height = 480)

## Line type of plot will be drawn for Global active power

plot(DateTime, globalActivePower, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

##  shuts down the specified (by default the current) device

dev.off()

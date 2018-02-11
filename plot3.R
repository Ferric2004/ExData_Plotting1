#Read the file in a clean way. 
#"Origin" is a placeholder name assigned to the file path in your local folder

library(tidyverse)
source <- read.table(origin, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric"), header = TRUE)


#Extracts only the values for February 1 and 2

february <- source %>% filter(Date %in% c("1/2/2007", "2/2/2007"))


#Creates a timeseries (Year-Month-Day-Time)

feb_date <- dmy(february$Date)
feb_time <- hms(february$Time)
timeseries <- feb_date + feb_time


#Creates and export Plot in PNG format

png("plot3.png")
plot(timeseries, february$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(timeseries, february$Sub_metering_2, col = "red")
lines(timeseries, february$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
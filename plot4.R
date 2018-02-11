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

plot2_set <- data.frame(Time = timeseries,Power = february$Global_active_power, stringsAsFactors = FALSE)



#Creates and export Plot in PNG format

png("plot4.png")

par(mfrow=c(2,2))

plot(plot2_set$Time, plot2_set$Power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

plot(timeseries, february$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(timeseries, february$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(timeseries, february$Sub_metering_2, col = "red")
lines(timeseries, february$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(timeseries, february$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
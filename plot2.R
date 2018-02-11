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

png("plot2.png")
plot(plot2_set$Time, plot2_set$Power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()
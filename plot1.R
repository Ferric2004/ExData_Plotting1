#Read the file in a clean way. 
"Origin" is a placeholder name assigned to the file path in your local folder

source <- read.table(origin, sep = ";", stringsAsFactors = FALSE, na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric"), header = TRUE)


#Extracts only the values for February 1 and 2

february <- source %>%
    filter(Date %in% c("1/2/2007", "2/2/2007"))


#Creates and export Plot in PNG format

png("plot1.png")
plot1 <- hist(february$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
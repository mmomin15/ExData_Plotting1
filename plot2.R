plot2 <- function() {
library(data.table)
data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "NA")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- data[(data$Date =="2007-02-01") | (data$Date == "2007-02-02"),]
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
data1 <- transform(data1, timestamp= as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(data1$timestamp, data1$Global_active_power, type="l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
}
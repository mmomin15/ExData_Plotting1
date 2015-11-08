plot3 <- function() {
  library(data.table)
  data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "NA")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data1 <- data[(data$Date =="2007-02-01") | (data$Date == "2007-02-02"),]
  data1 <- transform(data1, date_time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  data1$Sub_metering_1 <- as.numeric(as.character(data1$Sub_metering_1))
  data1$Sub_metering_2 <- as.numeric(as.character(data1$Sub_metering_2))
  data1$Sub_metering_3 <- as.numeric(as.character(data1$Sub_metering_3))
  plot(data1$date_time,data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data1$date_time,data1$Sub_metering_2,col="red")
  lines(data1$date_time,data1$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), 
         c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
         lty=c(1,1), lwd=c(1,1), cex = 0.5)
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
}


plot4 <- function() {
  library(data.table)
  data <- fread("household_power_consumption.txt", header = TRUE, na.strings = "NA")
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data1 <- data[(data$Date =="2007-02-01") | (data$Date == "2007-02-02"),]
  data1 <- transform(data1, date_time = as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  par(mfrow=c(2,2))
  
  #PLOT 1
  plot(data1$date_time,data1$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  #PLOT 2
  plot(data1$date_time,data1$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  #PLOT 3
  plot(data1$date_time,data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data1$date_time,data1$Sub_metering_2,col="red")
  lines(data1$date_time,data1$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=0.4, y.intersp = 0.5)
  #PLOT 4
  plot(data1$date_time,data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
}
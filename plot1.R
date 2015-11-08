plot1 <- function (){
  library(data.table)
  data <- fread("household_power_consumption.txt", header = TRUE)
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data1 <- data[(data$Date =="2007-02-01") | (data$Date == "2007-02-02"),]
  data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
  hist(data1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
  dev.copy(png, file = "plot1.png", width=480, height=480)
  dev.off()
}
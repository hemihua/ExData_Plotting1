library(data.table)

## Read in dataset and create Plot 1

setwd("d:/coursera/exdata_plotting1")
data <- fread("household_power_consumption.txt", header=TRUE, sep=";")
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data <- transform(data, Global_active_power = as.numeric(Global_active_power),
                  Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),
                  Sub_metering_3 = as.numeric(Sub_metering_3))

png("plot2.png", width=480, height=480, type="windows")
plot(data$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", 
     typ="l", xaxt="n")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

dev.off()

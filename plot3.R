library(data.table)

## Read in dataset and create Plot 3

setwd("d:/coursera/exdata_plotting1")
data <- fread("household_power_consumption.txt", header=TRUE, sep=";")
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data <- transform(data, Global_active_power = as.numeric(Global_active_power),
                  Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),
                  Sub_metering_3 = as.numeric(Sub_metering_3))

png("plot3.png", width=480, height=480, type="windows")
plot(data$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", typ="l", xaxt="n")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),col=c("black","red","blue"))

dev.off()

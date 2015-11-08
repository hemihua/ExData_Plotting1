library(data.table)

## Read in dataset and create Plot 4

setwd("d:/coursera/exdata_plotting1")
data <- fread("household_power_consumption.txt", header=TRUE, sep=";")
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data <- transform(data, Global_active_power = as.numeric(Global_active_power),
                  Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),
                  Sub_metering_3 = as.numeric(Sub_metering_3),
                  Voltage = as.numeric(Voltage),
                  Global_reactive_power = as.numeric(Global_reactive_power))

png("plot4.png", width=480, height=480, type="windows")

## create a 2x2 layout
par(mfrow=c(2,2))

## plot topleft graph of global active power
plot(data$Global_active_power, main="", xaxt="n", ylab="Global Active Power", 
     typ="l", xlab="")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## plot topright graph of voltage
plot(data$Voltage, main="", xlab="datetime", typ="l",xaxt="n", ylab="Voltage")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))

## plot bottomleft graph of submetering
plot(data$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", typ="l", xaxt="n")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),col=c("black","red","blue"), bty="n")

## plot bottomright graph of global reactive power
plot(data$Global_reactive_power, main="", xlab="datetime", ylab="Global_reactive_power", typ="l")
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"),xaxt="n")


dev.off()

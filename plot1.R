library(data.table)

## Read in dataset and create Plot 1

setwd("d:/coursera/exdata_plotting1")
data <- fread("household_power_consumption.txt", header=TRUE, sep=";")
data <- data[which(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
data <- transform(data, Global_active_power = as.numeric(Global_active_power))

png("plot1.png", width=480, height=480, type="windows")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

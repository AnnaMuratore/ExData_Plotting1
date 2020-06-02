setwd("D://Coursera_R_Programming/Exploratory Data Analysis/Project 1")

#Reading Data and subsetting
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
subdata <- subset(data, Date=="1/2/2007"| Date=="2/2/2007")

#Date-Time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

#Plot 4 
#I'm sorry, I come from Italy, so my weekdays are in italian
#gio= Thu, ven= Fri and sab= Sat
png("plot4.png", 480, 480)
par(mfrow= c(2,2))
plot(subdata$DateTime,subdata$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
plot(subdata$DateTime, subdata$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")
plot(subdata$DateTime, subdata$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab="",
     type="l",
     col="black")
lines(subdata$DateTime, subdata$Sub_metering_2,
      col="red")
lines(subdata$DateTime, subdata$Sub_metering_3,
      col="blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1:1,
       col=c("black", "red", "blue"),
       bty = "n")
plot(subdata$DateTime, subdata$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")
dev.off()

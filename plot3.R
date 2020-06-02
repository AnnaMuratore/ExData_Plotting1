setwd("D://Coursera_R_Programming/Exploratory_Data_Analysis/Project1")

#Reading Data and subsetting
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
subdata <- subset(data, Date=="1/2/2007"| Date=="2/2/2007")

#Date-Time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

#Plot 3 
#I'm sorry, I come from Italy, so my weekdays are in italian 
#gio= Thu, ven= Fri and sab= Sat
png("plot3.png", 480, 480)
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
       col=c("black", "red", "blue"))
dev.off()

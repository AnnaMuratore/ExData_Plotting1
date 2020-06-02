setwd("D://Coursera_R_Programming/Exploratory Data Analysis/Project 1")

#Reading Data and subsetting
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
subdata <- subset(data, Date=="1/2/2007"| Date=="2/2/2007")

#Date-Time
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, "%d/%m/%Y %H:%M:%S")

#Plot 2 
#I'm sorry, I come from Italy, so my weekdays are in italian 
#gio= Thu, ven= Fri and sab= Sat
plot(subdata$DateTime,subdata$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     type = "l")
dev.copy(png, "plot2.png")

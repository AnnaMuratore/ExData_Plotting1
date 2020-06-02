setwd("D://Coursera_R_Programming/Exploratory Data Analysis/Project 1")

#Reading Data and subsetting
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header = TRUE)
subdata <- subset(data, Date=="1/2/2007"| Date=="2/2/2007")

#Converting Date 
subdata$Date <- as.Date(subdata$Date, "%d/%m/%Y")

#Plot1
hist(subdata$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, "plot1.png")

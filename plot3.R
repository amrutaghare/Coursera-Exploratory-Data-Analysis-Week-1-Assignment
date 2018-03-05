##Setting directory##
setwd("C:/Users/amrutag542/Documents/Study Material/Coursera/Exploratory Data Analysis/Week 1/Assignment 1")
##Reading data##
data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F,dec=".")
##subsetting data##
data1 <-subset(data, Date %in% c("1/2/2007","2/2/2007"))
##converting into date:time format#
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$datetime <- paste(data1$Date, data1$Time)
data1$datetime <- as.POSIXct(data1$datetime)
##plotting data
png("plot3.png", width=480, height=480)
with(data1,{
  plot(data1$Sub_metering_1~data1$datetime, type="l",ylab="Energy sub metering", xlab="")
  lines(data1$Sub_metering_2~data1$datetime,col='Red')
  lines(data1$Sub_metering_3~data1$datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

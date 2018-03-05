##setting directory##
setwd("C:/Users/amrutag542/Documents/Study Material/Coursera/Exploratory Data Analysis/Week 1/Assignment 1")
##reading data##
data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F,dec=".")
##subsetting data#
data1 <-subset(data, Date %in% c("1/2/2007","2/2/2007"))
##converting into date:time format##
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$datetime <- paste(data1$Date, data1$Time)
data1$datetime <- as.POSIXct(data1$datetime)
##plotting all 4 charts together##
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(data1$Global_active_power~data1$datetime, type="l",ylab="Global Active Power", xlab="")

plot(data1$Voltage~data1$datetime, type="l",ylab="Voltage", xlab="datetime")


with(data1,{
  plot(data1$Sub_metering_1~data1$datetime, type="l",ylab="Energy sub metering", xlab="")
  lines(data1$Sub_metering_2~data1$datetime,col='Red')
  lines(data1$Sub_metering_3~data1$datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data1$Global_reactive_power~data1$datetime, type="l",ylab="Global_reactive_power", xlab="datetime")

dev.off()

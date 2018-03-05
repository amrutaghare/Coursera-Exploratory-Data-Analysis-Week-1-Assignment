##Setting directory##
setwd("C:/Users/amrutag542/Documents/Study Material/Coursera/Exploratory Data Analysis/Week 1/Assignment 1")
##Reading data##
data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F,dec=".")
##Subsetting data##
data1 <-subset(data, Date %in% c("1/2/2007","2/2/2007"))
##Converting into date format##
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
##Plotting a histogram and exporting it to the directory##
png("plot1.png", width=480, height=480)
hist(data1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



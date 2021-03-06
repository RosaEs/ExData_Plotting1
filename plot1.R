# Project 1 Exploratory Data Analysis
# plot1.R

# set working directory
# setwd("C:/Users/Rosa/Data Science Specialization/Exploratory Data Analysis")

# Read data
data <- read.table("data/household_power_consumption.txt", sep=';', header=TRUE,
                   na.strings='?')

# Convert dates and times and subset from 2007-02-01 to 2007-02-02
data$Date<-as.character(data$Date)
data$Time<-as.character(data$Time)
data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data <- subset(data,as.Date(DateTime) >= as.Date("2007-02-01") &
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# Open plot1.png
png("plot1.png", height=480, width=480)

# Histogram
with(data,hist(Global_active_power, col='red',
               xlab = 'Global Active Power (kilowatts)',
               main = 'Global Active Power'))

# Close PNG file
dev.off()

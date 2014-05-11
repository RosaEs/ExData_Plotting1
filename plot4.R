# Project 1 Exploratory Data Analysis
# plot4.R

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

# Open plot4.png
png("plot4.png", height=480, width=480)

# Plot
par(mfrow=c(2,2))

# = plot2
with(data,plot(DateTime,Global_active_power,pch=NA,
               xlab="", ylab="Global Active Power"))
with(data,lines(DateTime,Global_active_power))

# plotVoltage
with(data,plot(DateTime,Voltage,pch=NA,
               xlab="datetime", ylab="Voltage"))
with(data,lines(DateTime,Voltage))

# = plot3
with(data,plot(DateTime,Sub_metering_1,pch=NA,
               xlab="", ylab="Energy sub metering"))
with(data,lines(DateTime, Sub_metering_1, col='black'))
with(data,lines(DateTime, data$Sub_metering_2, col='red'))
with(data,lines(DateTime, data$Sub_metering_3, col='blue'))
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             col = c('black', 'red', 'blue'),lty = c(1,1,1), bty="n" )

# plotReactivePower
with(data,plot(DateTime,Global_reactive_power,pch=NA,
               xlab="datetime", ylab="Global reactive power"))
with(data,lines(DateTime,Global_reactive_power))

# Close PNG file
dev.off()


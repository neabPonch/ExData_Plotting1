#this script will plot days of week vs global active power from
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

#read in data from zip file from 2 days we're interested in ("01/02/2007" & "02/02/2007")

setwd("C:/Users/Ponchie/Documents/GitHub/ExData_Plotting1")
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = zipfile)
data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

TimeDate <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data <- cbind(data, TimeDate)

#coerce and format as necessary
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- format(data$Time, format="%H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#subset the two days of interest
subdata <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02" ) 

#plot the data using png() and plot()

png("plot2.png", width=480, height=480)
with(subdata, plot(TimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
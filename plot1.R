library(lubridate)

png(filename = "plot1.png")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power$datetime <- dmy(power$Date) + hms(power$Time)
time_range <- interval(ymd("2007-02-01"), ymd("2007-02-03"))
power.subset <- subset(power, datetime %within% time_range)

hist(power.subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()
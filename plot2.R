library(lubridate)

png(filename = "plot2.png")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power$datetime <- dmy(power$Date) + hms(power$Time)
time_range <- interval(ymd("2007-02-01"), ymd("2007-02-03"))
power.subset <- subset(power, datetime %within% time_range)

with(power.subset, 
     plot(datetime, Global_active_power, 
          type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
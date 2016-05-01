library(lubridate)

png(filename = "plot3.png")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power$datetime <- dmy(power$Date) + hms(power$Time)
time_range <- interval(ymd("2007-02-01"), ymd("2007-02-03"))
power.subset <- subset(power, datetime %within% time_range)

with(power.subset, plot(datetime, Sub_metering_1, type = "l", 
                        xlab = "", ylab = "Energy sub metering"))
with(power.subset, lines(datetime, Sub_metering_2, col = "red"))
with(power.subset, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1)

dev.off()


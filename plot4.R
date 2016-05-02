library(lubridate)

png(filename = "plot4.png")

power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
power$datetime <- dmy(power$Date) + hms(power$Time)
time_range <- interval(ymd("2007-02-01"), ymd("2007-02-03"))
power.subset <- subset(power, datetime %within% time_range)

par(mfrow=c(2,2))

# Graph 1
with(power.subset, 
     plot(datetime, Global_active_power, 
          type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
# Graph 2
with(power.subset, plot(datetime, Voltage, type = "l"))

# Graph 3
with(power.subset, plot(datetime, Sub_metering_1, type = "l", 
                        xlab = "", ylab = "Energy sub metering"))
with(power.subset, lines(datetime, Sub_metering_2, col = "red"))
with(power.subset, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", col = c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 1)

# Graph 4
with(power.subset, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
## Set plots and create PNG file
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(powerdata$DateTime, powerdata$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(powerdata$DateTime, powerdata$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l", col = "black")
points(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
points(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
plot(powerdata$DateTime, powerdata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
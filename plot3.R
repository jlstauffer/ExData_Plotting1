## Plot the scatterplots and create PNG file
png(filename = "plot3.png")
plot(powerdata$DateTime, powerdata$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l", col = "black")
points(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
points(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
dev.off()
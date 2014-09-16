## Plot the line-connected scatterplot and create PNG file
png(filename = "plot2.png")
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
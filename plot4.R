## Create data subdirectory, if needed
if (!file.exists("./data")) dir.create("./data")

## Download, unzip, and read in data file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/household_power_consumption.zip"
              ,method = "curl")
unzip("./data/household_power_consumption.zip", exdir = "./data")
powerdata <- read.table(file = "./data/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings = "?")

# Create typed Date column and restrict data to 2007-02-01 through 2007-02-02
powerdata$DateTime <- strptime(paste(as.character(powerdata$Date),
                                     as.character(powerdata$Time)),
                               format = "%d/%m/%Y %H:%M:%S")
powerdata <- powerdata[powerdata$DateTime >=
                             strptime("2007-02-01",format = "%Y-%m-%d") &
                             powerdata$DateTime <
                             strptime("2007-02-03", format = "%Y-%m-%d") &
                             !is.na(powerdata$DateTime),]

## Set plots and create PNG file
par(mfrow = c(2,2))
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
plot(powerdata$DateTime, powerdata$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "n",
     xlab = "", ylab = "Energy sub metering")
points(powerdata$DateTime, powerdata$Sub_metering_1, type = "l", col = "black")
points(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
points(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", pch = "-", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
plot(powerdata$DateTime, powerdata$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
png(filename = "plot4.png")
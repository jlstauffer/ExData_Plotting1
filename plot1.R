## Create data subdirectory, if needed
if (!file.exists("./data")) dir.create("./data")

## Download, unzip, and read in data file
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "./data/household_power_consumption.zip"
              ,method = "curl")
unzip("./data/household_power_consumption.zip", exdir = "./data")
powerdata <- read.table(file = "./data/household_power_consumption.txt",
                        header = TRUE, sep = ";", na.strings = "?")

## Create typed Date column and restrict data to 2007-02-01 through 2007-02-02
powerdata$DateTime <- strptime(paste(as.character(powerdata$Date),
                                     as.character(powerdata$Time)),
                               format = "%d/%m/%Y %H:%M:%S")
powerdata <- powerdata[powerdata$DateTime >=
                             strptime("2007-02-01",format = "%Y-%m-%d") &
                             powerdata$DateTime <
                             strptime("2007-02-03", format = "%Y-%m-%d") &
                             !is.na(powerdata$DateTime),]


## Plot the histogram and create PNG file
png(filename = "plot1.png")
hist(powerdata$Global_active_power, main = "Global Active Power",
     xlab = "Global Actie Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()

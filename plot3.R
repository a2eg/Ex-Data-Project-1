#The file "household_power_consumption.txt" should be located at working directory

#Read sampleData
sampleData <- read.table("household_power_consumption.txt", 
                         header = TRUE, 
                         sep = ";", 
                         nrows = 50,
                         na.strings = '?')
classes <- sapply(sampleData, class)

#Read largeData
largeData <- read.table("household_power_consumption.txt", 
                        header = TRUE, 
                        colClasses = classes, 
                        sep = ";",
                        na.strings = '?')

#str(largeData)
x<-largeData[largeData$Date == '1/2/2007' | largeData$Date == '2/2/2007',]

#typeof(x)

ts <- strptime(paste(x$Date, x$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
#plot(ts, x$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

png(file="plot3.png")
plot(ts, x$Sub_metering_1, type="l", col='black', xlab="", ylab="Energy sub metering")
lines(ts, x$Sub_metering_2, col='red')
lines(ts, x$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))

dev.off()


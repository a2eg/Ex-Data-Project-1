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

png(file="plot4.png")

par(mfrow=c(2,2))

plot(ts, x$Global_active_power, type="l", xlab="DateTime", ylab="Global Active Power")

plot(ts, x$Voltage, type="l", xlab="DateTime", ylab="Voltage")

plot(ts, x$Sub_metering_1, type="l", col='black', xlab="DateTime", ylab="Energy sub metering")
lines(ts, x$Sub_metering_2, col='red')
lines(ts, x$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=1,col=c("black","red","blue"))

plot(ts, x$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power")

dev.off()
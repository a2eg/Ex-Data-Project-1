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
plot(ts, x$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,"plot2.png")
dev.off()
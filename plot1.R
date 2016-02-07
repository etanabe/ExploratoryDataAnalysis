x <- read.csv2("household_power_consumption.txt", na.strings = "?",
               colClasses = c("character", 
                              "character",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric",
                              "numeric"), dec = ".")

x$Date <- dmy(x$Date)
x <- subset(x, Date == ymd("2007-02-01") | Date == ymd("2007-02-02"))

dev.off()
png(filename = "plot3.png")
par(mfrow = c(1,1))
hist(x$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power kilowatts")
#dev.copy(png, file = "plot1.png")
dev.off()

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

x$Timestamp <- ymd_hms(paste(x$Date, x$Time))

dev.off()
png(filename = "plot3.png")
par(mfrow = c(1,1))


with(x, plot(Timestamp, Sub_metering_1,
             type = "n",
             ylab = "Energy sub metering",
             xlab = ""))
with(x, lines(Timestamp, Sub_metering_1,
              type = "l",
              col = "black"))
with(x, lines(Timestamp, Sub_metering_2,
              type = "l",
              col = "red"))
with(x, lines(Timestamp, Sub_metering_3,
              type = "l",
              col = "blue"))
legend("topright", pch = "_", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       xjust = 1)

#dev.copy(png, file = "plot3.png")
dev.off()

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
png(filename = "plot4.png")
par(mfrow = c(2,2))

#(1,1): Global Active Power
with(x, plot(Timestamp, Global_active_power,
             type = "l",
             ylab = "Global Active Power (kilowatts)",
             xlab = ""))

#(1,2): Voltage
with(x, plot(Timestamp, Voltage,
             type = "l",
             ylab = "Voltage",
             xlab = "datetime"))

#(2,1): Energy sub metering
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
       xjust = 1, bty = "n")

#(2,2): Global Reactive Power

with(x, plot(Timestamp, Global_reactive_power,
             type = "l",
             xlab = "datetime"))

#dev.copy(png, file = "plot3.png")
dev.off()

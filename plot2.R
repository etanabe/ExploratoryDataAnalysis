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

with(x, plot(Timestamp, Global_active_power,
             type = "l",
             ylab = "Global Active Power (kilowatts)",
             xlab = ""))

#dev.copy(png, file = "plot2.png")
dev.off()

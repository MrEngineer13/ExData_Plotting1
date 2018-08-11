rawdata <- read.table("household_power_consumption.txt",
                      header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".",
                      na.strings='?')

data <- subset(rawdata, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, as.numeric(data$Sub_metering_1), type="l", xlab="", 
     ylab="Energy sub metering")
points(datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
points(datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", lty = "solid", legend = c("Sub_metering_1", "Sub_metering_2", 
                             "Sub_metering_3"), col = c("black","blue", "red"))
dev.off()

my_data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";")
lb <- as.Date("2007-02-01")
ub <- as.Date("2007-02-02")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
c_data <-my_data[lb <= my_data$Date & my_data$Date <= ub,]
comb <- paste(c_data$Date,c_data$Time)
c_data$Time <- strptime(comb, "%Y-%m-%d %H:%M:%S")

for(i in 3:9){
        c_data[,i] <- as.numeric(as.character(c_data[,i]))
}


png(file="plot4.png",
    width=480, height=480)
par(mfcol = c(2,2))
plot(c_data$Time,c_data$Global_active_power, xlab = "",ylab = "Global active power (kilowatts)", type = "n")
lines(c_data$Time,c_data$Global_active_power)
plot(c_data$Time,c_data$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering")
lines(c_data$Time, c_data$Sub_metering_1,col="black")
lines(c_data$Time, c_data$Sub_metering_2,col="red")
lines(c_data$Time, c_data$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lty=1)
plot(c_data$Time,c_data$Voltage, ylab="Voltage", type="n")
lines(c_data$Time,c_data$Voltage)
plot(c_data$Time,c_data$Global_reactive_power, type = "n")
lines(c_data$Time,c_data$Global_reactive_power)
dev.off()
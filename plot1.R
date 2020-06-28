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


png(file="plot1.png",
    width=480, height=480)
hist(c_data$Global_active_power, main = "Global Active Power", xlab = "Global active power (kilowatts)", ylim=c(0,1200), col = "red")
dev.off()

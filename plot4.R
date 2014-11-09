
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?");

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),];

Sys.setlocale("LC_TIME", "C");
time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S");

png(filename = "plot4.png", width = 504, height = 504, units = "px");
par(mfrow = c(2, 2));

#1
plot(time, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power");

#2
plot(time, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

#3
plot(time,data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col = "black");
lines(time,data$Sub_metering_2, col = "red");
lines(time,data$Sub_metering_3, col = "blue");
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));

#4
plot(time, data$Global_reactive_power,xlab = "datetime", ylab = "Global_reactive_power", type = "l");


dev.off();

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?");

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),];

png(filename = "plot1.png", width = 504, height = 504, units = "px");
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red");

dev.off();
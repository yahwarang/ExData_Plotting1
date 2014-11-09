
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                   na.strings = "?");

data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),];

Sys.setlocale("LC_TIME", "C");
time <- strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S");

png(filename = "plot2.png", width = 504, height = 504, units = "px");
plot(time,data$Global_active_power,type="l",xlab=" ",ylab="Global Active Power(kilowatts)");
dev.off();
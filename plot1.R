# Open the file and assign it to el
el <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")

#Change class to correct format
el$Date <- as.Date(el$Date, format = "%d/%m/%Y")
el$Time <- format(el$Time, format = "%H:%M:%S")
el$Global_active_power <- as.numeric(el$Global_active_power)
el$Global_reactive_power <- as.numeric(el$Global_reactive_power)
el$Voltage <- as.numeric(el$Voltage)
el$Global_intensity <- as.numeric(el$Global_intensity)
el$Sub_metering_1 <- as.numeric(el$Sub_metering_1)
el$Sub_metering_2 <- as.numeric(el$Sub_metering_2)
el$Sub_metering_3 <- as.numeric(el$Sub_metering_3)

#Subset two days we care about
twodays <- subset(el, Date == "2007-02-01" | Date == "2007-02-02")

#Turn on png graphics device and create histogram
png("plot1.png", width = 480, height = 480)
hist(twodays$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()
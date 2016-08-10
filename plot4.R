# -------------------------Read the data-START--------------------------------

rawdata <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# -------------------------Read the data-FINISH-------------------------------

#-------------------------Format date and time-START--------------------------

rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
rawdata$Time <- format(strptime(rawdata$Time, "%H:%M:%S"), "%H:%M:%S")

#-------------------------Format date and time-FINISH-------------------------

#-------------------------Subset the dates-START------------------------------

data <- subset(rawdata, Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))
data <- cbind(data, datetime=as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"))

#-------------------------Subset the dates-FINISH-----------------------------

#-------------------------Plot histogram-START--------------------------------

par(mfcol=c(2,2), mar = c(4,4,1,2))

with(data, plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = ""))

with(data, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", text.width = 80000, y.intersp = 1.3)

with(data, plot(datetime, Voltage, type = "l"))

with(data, plot(datetime, Global_reactive_power, type = "l"))
#-------------------------Plot histogram-FINISH-------------------------------


#-------------------------Save histogram to PNG-START-------------------------

dev.copy(png, "./plot4.png", width=480, height=480)
dev.off()

#-------------------------Save histogram to PNG-START-------------------------


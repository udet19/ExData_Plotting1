# -------------------------Read the data-START--------------------------------

rawdata <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# -------------------------Read the data-FINISH-------------------------------


#-------------------------Format date and time-START--------------------------

rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
rawdata$Time <- format(strptime(rawdata$Time, "%H:%M:%S"), "%H:%M:%S")

#-------------------------Format date and time-FINISH-------------------------

#-------------------------Subset the dates-START------------------------------

data <- subset(rawdata, Date==as.Date("2007-02-01") |  Date==as.Date("2007-02-02"))

#-------------------------Subset the dates-FINISH-----------------------------

#-------------------------Plot histogram-START--------------------------------

hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#-------------------------Plot histogram-FINISH-------------------------------


#-------------------------Save histogram to PNG-START-------------------------

dev.copy(png, "./plot1.png")
dev.off()

#-------------------------Save histogram to PNG-START-------------------------


#reading data into R:
fulldata<- read.table("household_power_consumption.txt", sep=";", header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days:
data<- subset(fulldata, (fulldata$Date == "1/2/2007" | fulldata$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date:
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable and creating a new column in dataset named "DateTime":
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Creating the plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(data$DateTime,data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(data$DateTime,data$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()

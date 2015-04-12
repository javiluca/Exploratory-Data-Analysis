# Load global matrix data
fulldata <- read.table("C:\\Users\\Usuario\\Desktop\\EDA\\Porject 1\\household_power_consumption.txt", nrows= 2075260, header=T, sep=";", quote = "", strip.white = T, stringsAsFactors = F, na.strings = "?",  )

# Subsetting data

data<- subset(fulldata, (fulldata$Date == "1/2/2007" | fulldata$Date== "2/2/2007")) 

# Converting dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

# Creating Plot
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power,  type= "l", lwd=1,  ylab="Global Active Power (kilowatts)", xlab="")

#Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
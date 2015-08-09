# Setting my working directory
setwd('C:/datasciencecoursera/exploratory')

# Original dataset
econsumption <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

econsumption$Date <- as.Date(econsumption$Date, format="%d/%m/%Y")


# Pickup the data for dates "2007-02-01" & "2007-02-02"
econsumption_subset <- subset(econsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Concatenate Date & Time
datetime <- paste(as.Date(econsumption_subset$Date), econsumption_subset$Time)
econsumption_subset$Datetime <- as.POSIXct(datetime)

#Create Histogram
hist(econsumption_subset$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save histogram to file 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

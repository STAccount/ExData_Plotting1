# Setting my working directory
setwd('C:/datasciencecoursera/exploratory')

# Original dataset
econsumption <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=2075259,check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

econsumption$Date <- as.Date(econsumption$Date, format="%d/%m/%Y")


# Pickup the data for dates "2007-02-01" & "2007-02-02"
econsumption_subset <- subset(econsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Concatenate Date & Time
datetime <- paste(as.Date(econsumption_subset$Date), econsumption_subset$Time)
econsumption_subset$Datetime <- as.POSIXct(datetime)


#construct the graph
with(econsumption_subset, {
	plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
	lines(Sub_metering_2~Datetime,col='Red')
	lines(Sub_metering_3~Datetime,col='Blue')
			  }
    )
legend("topright", col=c("Black", "Red", "Blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the graph to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
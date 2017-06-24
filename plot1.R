#Read data from text file
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

#Target data from 2007-02-01 to 2007-02-02
dates<- data$Date=="1/2/2007"|data$Date=="2/2/2007"
targetdata<-data[dates,]
targetdata$Date <- as.Date(targetdata$Date, format = "%d/%m/%Y")

#Global Active Power histogram plot and output as png
hist(targetdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
#Read data from text file
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

#Target data from 2007-02-01 to 2007-02-02
dates<- data$Date=="1/2/2007"|data$Date=="2/2/2007"
targetdata<-data[dates,]
targetdata$Date <- as.Date(targetdata$Date, format = "%d/%m/%Y")

#Date convert to Date/Time
targetdata$DateTime<-paste(targetdata$Date,targetdata$Time)
targetdata$DateTime<-as.POSIXct(strptime(targetdata$DateTime,format="%Y-%m-%d %H:%M:%S"))

#Global Active Power time series plot and output as png
with(targetdata, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png")
dev.off()
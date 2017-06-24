#Read data from text file
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

#Target data from 2007-02-01 to 2007-02-02
dates<- data$Date=="1/2/2007"|data$Date=="2/2/2007"
targetdata<-data[dates,]
targetdata$Date <- as.Date(targetdata$Date, format = "%d/%m/%Y")

#Date convert to Date/Time
targetdata$DateTime<-paste(targetdata$Date,targetdata$Time)
targetdata$DateTime<-as.POSIXct(strptime(targetdata$DateTime,format="%Y-%m-%d %H:%M:%S"))

#Energy sub  metering time series plot and output as png
with(targetdata, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(targetdata, lines(DateTime, Sub_metering_2, col="red"))
with(targetdata,  lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()
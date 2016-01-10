mydata = read.table(file="~/Exploratory data analysis Coursera/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")

mydata$Time <- format(mydata$Time, format="%H:%M:%S")

mydata <- mydata[mydata$Date == "2007-02-01"| mydata$Date =="2007-02-02",]

mydata <- within(mydata,{ timestamp=format(as.POSIXct(paste(mydata$Date, mydata$Time)), "%Y-%m-%d %H:%M:%S") })

mydata$timestamp <- strptime(mydata$timestamp, "%Y-%m-%d %H:%M:%S",tz="GMT")



png(filename = "~/Exploratory data analysis Coursera/plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

plot(mydata$timestamp,mydata$Global_active_power,main="",ylab="Global Active Power (kilowatts)",type="l",xlab="")

plot(mydata$timestamp,mydata$Voltage,main="",ylab="Voltage",type="l",xlab="Datetime")

plot(mydata$timestamp,mydata$Sub_metering_1,main="",ylab="Energy sub Metering",type="l",xlab="")
lines(mydata$timestamp,mydata$Sub_metering_2,main="",ylab="Energy sub Metering",type="l",xlab="",col="red")
lines(mydata$timestamp,mydata$Sub_metering_3,main="",ylab="Energy sub Metering",type="l",xlab="",col="blue")
legend(x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))



plot(mydata$timestamp,mydata$Global_reactive_power,main="",ylab="Global_reactive_power",type="l",xlab="Datetime")

dev.off()

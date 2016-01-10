mydata = read.table(file="~/Exploratory data analysis Coursera/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")

mydata$Time <- format(mydata$Time, format="%H:%M:%S")

mydata <- mydata[mydata$Date == "2007-02-01"| mydata$Date =="2007-02-02",]


png(filename = "~/Exploratory data analysis Coursera/plot1.png",
    width = 480, height = 480)

hist(mydata$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")


dev.off()


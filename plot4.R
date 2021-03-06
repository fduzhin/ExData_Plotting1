fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file (fileurl,destfile="./household_power_consumption.zip",method="curl")
unzip("./household_power_consumption.zip")
power_data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

day1 <- subset(power_data, power_data$Date=="1/2/2007")
day2 <- subset(power_data, power_data$Date=="2/2/2007")

both_days <- rbind(day1,day2)
both_days$Time <- strptime(paste(both_days$Date,both_days$Time),format="%d/%m/%Y %H:%M:%S")
both_days$Date <- as.Date(both_days$Date,format="%d/%m/%Y")

summary(both_days)  


png(filename = "plot4.png")

par(mfrow=c(2,2))
plot(both_days$Time,both_days$Global_active_power,xlab="",ylab="Global Active Power",main="",type="n")
lines(both_days$Time,both_days$Global_active_power)

plot(both_days$Time,both_days$Voltage,xlab="datetime",ylab="Voltage",main="",type="n")
lines(both_days$Time,both_days$Voltage)

plot(both_days$Time,both_days$Sub_metering_1,xlab="",ylab="Energy sub metering",main="",type="n")
lines(both_days$Time,both_days$Sub_metering_1,col="black")
lines(both_days$Time,both_days$Sub_metering_2,col="red")
lines(both_days$Time,both_days$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=c(1,1,1),lwd=c(1.5,1.5,1.5),bty="n")

plot(both_days$Time,both_days$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",main="",type="n")
lines(both_days$Time,both_days$Global_reactive_power)

dev.off()

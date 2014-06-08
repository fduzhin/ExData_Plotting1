fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file (fileurl,destfile="./household_power_consumption.zip",method="curl")
unzip("./household_power_consumption.zip")
power_data <- read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
summary(power_data)

day1 <- subset(power_data, power_data$Date=="1/2/2007")
day1[1000:1010,]
summary(day1)

day2 <-  subset(power_data, power_data$Date=="2/2/2007")
day2[1000:1010,]
summary(day2)

both_days <- rbind(day1,day2)
summary(both_days)  
both_days[1000:1010,]
active_power <- both_days$Global_active_power
active_power[1000:1010]

png(filename = "plot1.png")
hist(active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
#as.Date("2/2/2007",  "%d/%m/%y")
#as.Date(dates, "%m/%d/%y")
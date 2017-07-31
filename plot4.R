##Assumes data is loaded and prepared using the LoadinData.R script also provided

##Open .png graphics
png(filename = "plot4.png")

##Produce 4 plots with in 1 png
par(mfrow=c(2,2))

#1
plot(energy_date$dateTime,energy_date$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")

#2
plot(energy_date$dateTime,energy_date$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")

#3
library(tidyr)
viz3<-energy_date
viz3$dateTime<-as.POSIXct(viz3$dateTime)
viz3<-gather(viz3,key=Sub_metering,value=measurement,Sub_metering_1,Sub_metering_2,Sub_metering_3)

with(subset(viz3,viz3$Sub_metering=="Sub_metering_1"),plot(dateTime,measurement,xlab = "",ylab = "Energy sub metering",type = "l"))
with(subset(viz3,viz3$Sub_metering=="Sub_metering_2"),lines(dateTime,measurement,col="red"))
with(subset(viz3,viz3$Sub_metering=="Sub_metering_3"),lines(dateTime,measurement,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")

#4
plot(energy_date$dateTime,energy_date$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")


##Close .png to write plot
dev.off()
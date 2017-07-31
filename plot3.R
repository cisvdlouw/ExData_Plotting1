##Open .png graphics
png(filename = "plot3.png")

##Use library tidyr to prepare the dataset for visualization
library(tidyr)
viz3<-energy_date
viz3$dateTime<-as.POSIXct(viz3$dateTime)
viz3<-gather(viz3,key=Sub_metering,value=measurement,Sub_metering_1,Sub_metering_2,Sub_metering_3)

##Produce plot with elements required according to description (will automatically plot to PNG)
##Then add lines with the correct colors and finally add a legend
with(subset(viz3,viz3$Sub_metering=="Sub_metering_1"),plot(dateTime,measurement,xlab = "",ylab = "Energy sub metering",type = "l"))
with(subset(viz3,viz3$Sub_metering=="Sub_metering_2"),lines(dateTime,measurement,col="red"))
with(subset(viz3,viz3$Sub_metering=="Sub_metering_3"),lines(dateTime,measurement,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="-")


##Close .png to write plot
dev.off()
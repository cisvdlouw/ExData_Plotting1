##Open .png graphics
png(filename = "plot2.png")

##Produce plot with elements required according to description (will automatically plot to PNG)
plot(energy_date$dateTime,energy_date$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")

##Close .png to write plot
dev.off()
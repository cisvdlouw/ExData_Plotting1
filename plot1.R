##Assumes data is loaded and prepared using the LoadinData.R script also provided

##Open .png graphics
png(filename = "plot1.png")

##Produce plot with elements required according to description (will automatically plot to PNG)
hist(energy_date$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

##Close .png to write plot
dev.off()
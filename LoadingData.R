##Script for loading the data and parsing all variables to their required type
##Assumes the data is in the root directory of the project
energy_date<-read.csv2("household_power_consumption.txt",sep=";",header = TRUE,na.strings = "?")
energy_date$dateTime<-strptime(paste(energy_date$Date,energy_date$Time),"%d/%m/%Y%H:%M:%S")
energy_date$Date<-as.Date(energy_date$Date,"%d/%m/%Y")
energy_date<-subset(energy_date,energy_date$Date==as.Date("2007-02-01")|energy_date$Date==as.Date("2007-02-02"))
energy_date$Global_active_power<-as.numeric(format(energy_date$Global_active_power,decimal.mark="."))
energy_date$Global_reactive_power<-as.numeric(format(energy_date$Global_reactive_power,decimal.mark="."))
energy_date$Sub_metering_1<-as.numeric(format(energy_date$Sub_metering_1,decimal.mark="."))
energy_date$Sub_metering_2<-as.numeric(format(energy_date$Sub_metering_2,decimal.mark="."))
energy_date$Sub_metering_3<-as.numeric(format(energy_date$Sub_metering_3,decimal.mark="."))
energy_date$Voltage<-as.numeric(format(energy_date$Voltage,decimal.mark="."))
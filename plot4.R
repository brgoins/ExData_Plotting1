data<-read.table("household_power_consumption.txt",sep=";", header= TRUE)
data$Date<-paste(data$Date, data$Time, sep=" ")
data$Date<-as.POSIXct(as.character(data$Date),
                      format = "%d/%m/%Y %H:%M:%S")
data<-subset(data,Date>=as.POSIXct("2007-02-01 00:00:00") & 
               Date <= as.POSIXct("2007-02-03 00:00:00"))
png(filename = "plot4.png", width = 480,height = 480)
par(mfrow=c(2,2))
plot(data$Date, data[,3], type = "l", xlab = "", 
     ylab = "Globl Active Power (kilowatts)")
plot(data$Date, data[,5], type = "l", xlab = "datetime", 
     ylab = "Voltage")
plot(data$Date, data[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date, data[,8], type = "l", col= "red")
lines(data$Date, data[,9], type = "l", col= "blue")
legend("topright",pch = 1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
plot(data$Date, data[,4], type = "l", xlab = "datetime", 
     ylab = "Globl Active Power (kilowatts)")
dev.off()
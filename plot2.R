data<-read.table("household_power_consumption.txt",sep=";", header= TRUE)
data$Date<-paste(data$Date, data$Time, sep=" ")
data$Date<-as.POSIXct(as.character(data$Date),
                                format = "%d/%m/%Y %H:%M:%S")
data<-subset(data,Date>=as.POSIXct("2007-02-01 00:00:00") & 
               Date <= as.POSIXct("2007-02-03 00:00:00"))
data[,c(3)]<-as.numeric(as.character(data[,c(3)]))
png(filename = "plot2.png", width = 480,height = 480)
plot(data$Date, data[,3], type = "l", xlab = "", 
     ylab = "Globl Active Power (kilowatts)")
dev.off()
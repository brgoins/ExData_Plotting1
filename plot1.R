data<-read.table("household_power_consumption.txt",sep=";", header= TRUE)
data$Date<-as.Date(as.character(data$Date),format = "%d/%m/%Y")
data<-subset(data,Date>=as.Date("2007-02-01") & Date <= as.Date("2007-02-03"))
data[,c(3)]<-as.numeric(as.character(data[,c(3)]))
png(filename = "plot1.png", width = 480,height = 480)
hist(data$Global_active_power, col = "red", main="Global Acive Power", 
     xlab = "Global Acive Power (kilowatts)")
dev.off()
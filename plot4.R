
setwd("E:/SymPhd/CourseworkAssignment/Coursera")

Totaldata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec= ".", stringsAsFactors=F,quote='\"',nrows=2075259)
specificdatedata <- subset(Totaldata, Date %in% c("1/2/2007","2/2/2007"))

Withdatetime <-paste(specificdatedata$Date,specificdatedata$Time)
conWithdatetime <- as.POSIXct(Withdatetime,format ="%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(specificdatedata$Global_active_power)
Voltage <- as.numeric(specificdatedata$Voltage)
Gobalreactivepower <- as.numeric(specificdatedata$Global_reactive_power)
subMetering1 <- as.numeric(specificdatedata$Sub_metering_1)
subMetering2 <- as.numeric(specificdatedata$Sub_metering_2)
subMetering3 <- as.numeric(specificdatedata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfcol=c(2,2), mar=c(5,5,2.5,1.5))

plot(conWithdatetime, globalActivePower, type="l", ylab="Global Active Power", xlab="")
plot(conWithdatetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(conWithdatetime,subMetering2, type="l", col="red")
lines(conWithdatetime,subMetering3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(conWithdatetime, Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(conWithdatetime, Gobalreactivepower, type="l", ylab="Global_reacive_power", xlab="datetime")

dev.off()

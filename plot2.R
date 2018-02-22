
setwd("E:/SymPhd/CourseworkAssignment/Coursera")

Totaldata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec= ".", stringsAsFactors=F,quote='\"',nrows=2075259)
specificdatedata <- subset(Totaldata, Date %in% c("1/2/2007","2/2/2007"))

Withdatetime <-paste(specificdatedata$Date,specificdatedata$Time)

conWithdatetime <- as.POSIXct(Withdatetime,format ="%d/%m/%Y %H:%M:%S")

globalActivePower <-as.numeric(specificdatedata$Global_active_power)

png("plot2.png", width=480, height=480)
plot(conWithdatetime,globalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

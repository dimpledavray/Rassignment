
setwd("E:/SymPhd/CourseworkAssignment/Coursera")

Totaldata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",dec= ".", stringsAsFactors=F,quote='\"',nrows=2075259)
specificdatedata <- subset(Totaldata, Date %in% c("1/2/2007","2/2/2007"))

globalActivePower <- as.numeric(specificdatedata$Global_active_power)

hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
hist(globalActivePower, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

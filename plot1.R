# Download and save zip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="./hpc.zip",method="curl")
# unzip the file
zipfile <- "hpc.zip"
unzip(zipfile,exdir=".")
# check files
list.files()
# [1] "household_power_consumption.txt" "hpc.zip"
# read useful data into R, i.e. data from dates 2007-02-01 and 2007-02-02
lines <- readLines("household_power_consumption.txt")
piece <- grep("^[1,2]/2/2007",lines)
pieceData <- read.table("household_power_consumption.txt",skip=piece[1]-1,nrow=length(piece)-1,header=F,na.strings="?",sep=";")
colnames(pieceData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# plot plot1.png
png(filename="./plot1.png",width=480,height=480,units="px")
with(pieceData,hist(Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red"))
dev.off()
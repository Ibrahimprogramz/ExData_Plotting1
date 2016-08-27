library(utils)

#download the data 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power.zip")
#files are downloaded on the default WD and unzipped from the WD
unzip("./power.zip",overwrite = T)

#the data has ";" as separators and it has its embedded headers which should be utilized. 
#I have found that read.csv with these arguments below works perfectly with .txt fiels
#Thus the following function arguments are used: 
power<-read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

#taking the required subset from the original dataset(power) and calling it power1
power1<-subset(power, Date=="1/2/2007"| Date=="2/2/2007")

#formatting date and Time variable to POSIXct into a new variable "datetime"
power1$datetime<-as.POSIXct(paste(power1$Date, power1$Time), format="%d/%m/%Y %H:%M:%S")

#drawing on the png file with width of 480 pixels and a height of 480 pixels
png(file = "plot3.png")
#starting of with the plot with sub_metering_1
plot(power1$datetime, power1$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")

#adding the red line for sub_metering_2
lines(power1$datetime, power1$Sub_metering_2, col="red")

#adding the blue line for sub_metering_3
lines(power1$datetime, power1$Sub_metering_3, col="blue")

#drawing the legend including all required details
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.off()
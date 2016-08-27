library(utils)

#download the data 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./power.zip")
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
png(file = "plot2.png")

#drawing the plot with "line" type
plot(power1$datetime, power1$Global_active_power, type ="l",xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()
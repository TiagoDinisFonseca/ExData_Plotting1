##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
##########################################################

plot4 <- function(){

	# getting the data from the file
	# it tries from the filtered file
	if (file.exists("household_power_consumption_filtered.txt")){
		data <- read.table("household_power_consumption_filtered.txt", head = T, sep = ';', colClasses = c('character', 'character', rep('numeric', 7)))

	# if it does not find it, it tries the normal file
	} else if (file.exists("household_power_consumption.txt")){
		data <- read.table("household_power_consumption_filtered.txt", head = T, sep = ';', colClasses = c('character', 'character', rep('numeric', 7)))
		data <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
		message("Consider filtering data before running this!\nIf you're using linux or OSX run:\ngrep household_power_consumption.txt -e '^[12]/2/2007\\|Date' > household_power_consumption_filtered.txt") 

	# otherwise it fails
  } else {
	return(message("fail: i could not find the data file:\nhousehold_power_consumption.txt"))
	}

	# transforming the field date from string to date
	data$Date <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

	# create the plot	
	png('plot4.png', width = 480, height = 480)
	par(mfrow = c(2,2))

	# plot 1-1
	plot(data$Date, data$Global_active_power, ylab = "Global active power (kilowatts)", xlab = "", type = "l")

	# plot 1-2
	plot(data$Date, data$Voltage, ylab = "Voltage", xlab = "", type = "l")

	# plot 2-1
	plot(data$Date, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
	points(data$Date, data$Sub_metering_2, type = "l", col = "red")
	points(data$Date, data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", bty = "n", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1,  col = c("black", "red", "blue"))

	# plot 2-2
	plot(data$Date, data$Global_reactive_power, ylab = "Global reactive power (kilowatts)", xlab = "", type = "l")


	dev.off()

	# finish	
	message('plot created')
}


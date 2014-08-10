##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
# Here are 4 plots together, which try to mimick the     #
# ones requested, there are some differences by choice   #
##########################################################

plot4 <- function(){

	# getting the data from the file
	source("aux.R")
	if(!get_data()){
		return(message("finish"))
	}

	# transforming the field date from string to date
	data$Date <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

	# week days in english
	Sys.setlocale("LC_TIME", "en_US")

	# create the plot	
	png('plot4.png', width = 480, height = 480)
	par(mfrow = c(2,2))

	# plot 1-1
	plot(data$Date, data$Global_active_power, ylab = "Global active power (kilowatts)", xlab = "", type = "l")

	# plot 1-2
	plot(data$Date, data$Voltage, ylab = "Voltage (volts)", xlab = "", type = "l")

	# plot 2-1
	plot(data$Date, data$Sub_metering_1, ylab = "Energy sub metering (watts-hour)", xlab = "", type = "l")
	points(data$Date, data$Sub_metering_2, type = "l", col = "red")
	points(data$Date, data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", bty = "n", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1,  col = c("black", "red", "blue"))

	# plot 2-2
	plot(data$Date, data$Global_reactive_power, ylab = "Global reactive power (kilowatts)", xlab = "", type = "l")


	dev.off()

	# finish	
	message('plot created')
}


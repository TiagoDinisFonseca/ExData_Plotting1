##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
# This third plot contains three lines with the energy 	 #
# sub metering (types 1, 2 and 3) in funciton of time    #
##########################################################

plot3 <- function(){

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
	png('plot3.png', width = 480, height = 480)
	plot(data$Date, data$Sub_metering_1, ylab = "Energy sub metering (watts-hour)", xlab = "", type = "l")
	points(data$Date, data$Sub_metering_2, type = "l", col = "red")
	points(data$Date, data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=1,  col = c("black", "red", "blue"))
	dev.off()

	# finish	
	message('plot created')
}


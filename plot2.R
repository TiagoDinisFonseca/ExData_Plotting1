##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
# This second plot is a simple plot of the global active #
# power in function of time                              #
##########################################################

plot2 <- function(){

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
	png('plot2.png', width = 480, height = 480)
	plot(data$Date, data$Global_active_power, ylab = "Global active power (kilowatts)", xlab = "", type = "l")
	dev.off()

	# finish	
	message('plot created')
}


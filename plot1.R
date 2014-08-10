##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
# This first plot is an historgram with the frequency of #
# the global active power                                #
##########################################################

plot1 <- function(){

	# getting the data from the file, it finishes if it fails
	source("aux.R")
	if(!get_data()){
		return(message("finish"))
	}

	# transforming the field date from string to date
	data$Date <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

	# create the plot	
	png('plot1.png', width = 480, height = 480)
	hist(data$Global_active_power, main = "Global active power", xlab = "Global active power (kilowatts)", col = "red")
	dev.off()

	# finish	
	message('plot created')
}


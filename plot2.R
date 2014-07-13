##########################################################
# This is the homework for the Exploratory Data Analysis #
# course.                                                #
# This second plot is a simple plot of the global active #
# power in function of time                              #
##########################################################

plot2 <- function(){

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
	png('plot2.png', width = 480, height = 480)
	plot(data$Date, data$Global_active_power, ylab = "Global active power (kilowatt)", xlab = "", type = "l")
	dev.off()

	# finish	
	message('plot created')
}


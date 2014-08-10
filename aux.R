##########################################################
# This is an auxiliary file for the homework for the     #
# Exploratory Data Analysis course.                      #
##########################################################

# It gets the data...
get_data <- function(){
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
		message("fail: i could not find the data file:\nhousehold_power_consumption.txt")
		return(F)
	}
	return(T)
}

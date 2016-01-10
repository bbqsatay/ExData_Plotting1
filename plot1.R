plot1 <- function( ) {
       
    data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";",stringsAsFactors=FALSE)

    ## then change to date format
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    ## extract data from the 2 dates we want
    data2 <- subset(data, (Date == "2007-02-01") | (Date == "2007-02-02")) 

    ## convert power field to numeric
    data2$Global_active_power <- as.numeric(data2$Global_active_power)
    ## plot histogram

    ## write to png file in same directory
    png(file="plot1.png")


    hist(data2$Global_active_power, col = "red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
    
    ## close device
    dev.off()

		
	}
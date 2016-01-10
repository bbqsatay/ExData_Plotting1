plot2 <- function( ) {
       
    data <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";",stringsAsFactors=FALSE)

    ## then change to date format
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    ## extract data from the 2 dates we want
    data2 <- subset(data, (Date == "2007-02-01") | (Date == "2007-02-02")) 

    ## convert power field to numeric
    data2$Global_active_power <- as.numeric(data2$Global_active_power)

    ## convert date and time, store the result in time variable
    data2$Time <- strptime(paste(data2$Date,data2$Time), "%Y-%m-%d %H:%M:%OS")

    ## plot histogram

    ## write to png file in same directory
    png(file="plot2.png")


    with(data2, plot(Time, Global_active_power,type = "l",xlab="", ylab="Global Active Power (kilowatts)"))
    
    ## close device
    dev.off()

		
	}
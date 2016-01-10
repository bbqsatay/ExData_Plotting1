plot3 <- function( ) {
       
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
    png(file="plot3.png")

   
    plot(data2$Time, data2$Sub_metering_1,type = "n",xlab="", ylab="Energy sub metering")
    points(data2$Time, data2$Sub_metering_1,type = "l", col = "black")
    points(data2$Time, data2$Sub_metering_2,type = "l", col = "red")
    points(data2$Time, data2$Sub_metering_3,type = "l", col = "blue")

    ## put in legend
    legend("topright",lwd=c(2,2,2), col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    
    ## close device
    dev.off()

		
	}
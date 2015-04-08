## Load the data into a dataframe. The separator character is ";" and null strings are stored as "?".

dframe1 <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Convert the date column to a Date class using the "as.Date" function:

dframe1$Date <- as.Date(dframe1$Date, format="%d/%m/%Y")

## Reload the data frame with a subset of the data limited by a date range:

dframe1 <- dframe1[dframe1$Date >= as.Date("2007-02-01") & dframe1$Date<=as.Date("2007-02-02"),]

## Concatenate the date and time columns into one column and then store back into the $Date column:
dframe1$Date <- as.POSIXlt(paste(dframe1$Date, dframe1$Time, sep=" "))

## Open a new "png" file named plot1.png with width and height of 480 pixels. This will contain the plot4:
png("plot4.png", width=480, height=480)

## Set parameters for the margins and set up 4 plots in a 2 x 2 orientation:
par(mar=c(4.7, 4.7, 0.7, 0.7), mfrow=c(2,2))

##Create plot1 - upper left:
plot(dframe1$Date, dframe1$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power")

##Create plot2 - upper right:
plot(dframe1$Date, dframe1$Voltage, 
     type="l",
     xlab="datetime", 
     ylab="Voltage")

##Create plot3 - lower left:
plot(dframe1$Date, dframe1$Sub_metering_1, 
     type="n", 
     lwd=1, 
     ylim=c(0, max(c(dframe1$Sub_metering_1, dframe1$Sub_metering_2, dframe1$Sub_metering_3))),
     xlab="", 
     ylab="Energy sub metering")

lines(dframe1$Date, dframe1$Sub_metering_1, col="black")
lines(dframe1$Date, dframe1$Sub_metering_2, col="red")
lines(dframe1$Date, dframe1$Sub_metering_3, col="blue")

legend("topright", 
        lwd=1, 
	col=c("black", "red", "blue"), 
	legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
	box.lwd=0,
        bty="n")

##Create plot4 - lower right:
plot(dframe1$Date, dframe1$Global_reactive_power, 
     type="l",
     xlab="datetime", 
     ylab="Global Reactive Power")

dev.off()

## Load the data into a dataframe. The separator character is ";" and null strings are stored as "?".

dframe1 <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Convert the date column to a Date class using the "as.Date" function:

dframe1$Date <- as.Date(dframe1$Date, format="%d/%m/%Y")

## Reload the data frame with a subset of the data limited by a date range:

dframe1 <- dframe1[dframe1$Date >= as.Date("2007-02-01") & dframe1$Date<=as.Date("2007-02-02"),]

## Concatenate the date and time columns into one column and then store back into the $Date column:
dframe1$Date <- as.POSIXlt(paste(dframe1$Date, dframe1$Time, sep=" "))

## Open a new "png" file named plot1.png with width and height of 480 pixels. This will contain the plot3:
png("plot3.png", width=480, height=480)

## Set parameters for the margins around the plot:
par(mar=c(4.2, 4.2, 0.5, 0.5))


## Set up the plot within the png file but do not plot yet:
plot(dframe1$Date, dframe1$Sub_metering_1, 
     type="n", 				##Defer plotting
     lwd=1, 
     ylim=c(0, max(c(dframe1$Sub_metering_1, dframe1$Sub_metering_2, dframe1$Sub_metering_3))), ##Find the highest y value and set that is the limit
     xlab="",				##Turn off the x label
     ylab="Energy sub metering")	##Set the y label

## Start plotting:
lines(dframe1$Date, dframe1$Sub_metering_1, col="black")
lines(dframe1$Date, dframe1$Sub_metering_2, col="red")
lines(dframe1$Date, dframe1$Sub_metering_3, col="blue")

##Create a legend:
legend("topright", lwd=1, 
	col=c("black", "red", "blue"), 
	legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

dev.off()
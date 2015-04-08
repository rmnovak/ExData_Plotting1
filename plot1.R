## Load the data into a dataframe. The separator character is ";" and null strings are stored as "?".

dframe1 <- read.table("household_power_consumption.txt",sep=";",header=T,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings="?")

## Convert the date column to a Date class using the "as.Date" function:

dframe1$Date <- as.Date(dframe1$Date, format="%d/%m/%Y")

## Reload the data frame with a subset of the data limited by a date range:

dframe1 <- dframe1[dframe1$Date >= as.Date("2007-02-01") & dframe1$Date<=as.Date("2007-02-02"),]

## Open a new "png" file named plot1.png with width and height of 480 pixels. This will contain the plot1.
png("plot1.png", width=480, height=480)

## Set parameters for the margins around the plot:
par(mar=c(4.2, 4.2, 0.5, 0.5))

## Create the plot within the png file:
hist(dframe1$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## Close the file so that it can be opended in another program:
dev.off()
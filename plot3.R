# plot3.R

# Load data (make sure "household_power_consumption.txt" is in your working directory)
data_full <- read.table("household_power_consumption.txt", 
                        header = TRUE, 
                        sep = ";", 
                        na.strings = "?", 
                        stringsAsFactors = FALSE)

# Convert Date column to Date type
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subset data for 1st and 2nd February 2007
data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Combine Date and Time into a single datetime column
datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Open PNG device
png("plot3.png", width = 480, height = 480)

# Create the plot with three lines
plot(datetime, data$Sub_metering_1, type = "l",
     xlab = "", 
     ylab = "Energy sub metering")

lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1)

# Close device
dev.off()
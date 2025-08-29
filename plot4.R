# plot4.R

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
png("plot4.png", width = 480, height = 480)

# Set layout to 2x2 plots
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage
plot(datetime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Plot 3: Energy sub metering
plot(datetime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(datetime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")

# Close device
dev.off()
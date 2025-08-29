# plot2.R

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
png("plot2.png", width = 480, height = 480)

# Create line plot
plot(datetime, data$Global_active_power, type = "l",
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()
# plot1.R

# Read the dataset
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", 
                   na.strings = "?", 
                   stringsAsFactors = FALSE)

# Convert the Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for dates 2007-02-01 and 2007-02-02
subset_data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Plot 1: Histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
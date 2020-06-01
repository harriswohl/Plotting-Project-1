#downloading, unzipping, and reading the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileUrl, temp)
data <- read.csv(unzip(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings = "?", colClasses = c(rep("character", 9)))
unlink(temp)

#subsetting data frame to include necessary dates
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#changing columns 3-9 classes to numeric, keeping date and time as character
data[, -c(1,2)] <- lapply(data[, -c(1,2)], as.numeric)

#creating column that merges date and time
datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%OS")

#replacing seperate date and columns with a single date/time representation
data <- data[, -c(1,2)]
data <- cbind(datetime, data)
data <- data[order(data$datetime),]


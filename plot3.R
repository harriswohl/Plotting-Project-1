with(data, plot(datetime, Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering"
))
points(data$datetime, data$Sub_metering_2, col = "red", type = "l")
points(data$datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                              "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

dev.copy(png, "plot3.png")
dev.off()
par(mfrow = c(2,2))

#plot1
with(data, plot(datetime, Global_active_power,
                type = "l", xlab = "",
                ylab = "Global Active Power"))
#plot2
with(data, plot(datetime, Voltage, type = "l"))

#plot 3
with(data, plot(datetime, Sub_metering_1, type = "l", xlab = "", 
                ylab = "Energy sub metering"))
points(data$datetime, data$Sub_metering_2, col = "red", type = "l")
points(data$datetime, data$Sub_metering_3, col = "blue", type = "l")
legend("topright", bty = "n", lty = 1, cex = .7, legend = c("Sub_metering_1",
                "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

#plot4
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.copy(png, "plot4.png")
dev.off()
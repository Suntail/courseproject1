hpc <- read.table(file="hpc.txt", header = T)
edit(hpc)

names(hpc)
# [1] "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage"               "Global_intensity"      "Sub_metering_1"       
# [8] "Sub_metering_2"        "Sub_metering_3"     

summary(hpc$Global_intensity)

dias <- hpc$Date	
horas <- hpc$Time
diashoras <- paste(dias, horas)
hpc$diashoras <- strptime(diashoras, "%d/%m/%Y %H:%M:%S", tz="")




# 1

hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (Killowats)", main = "Global Active Power")
dev.copy(png, file="primero.png")
dev.off()

# 2
plot(hpc$diashoras, hpc$Global_active_power, type = "l", ylab = "Global Active Power (Killowats)", xlab = "")
dev.copy(png, file="segundo.png")
dev.off()

# 3

plot(hpc$diashoras, hpc$Sub_metering_1, type = "l", ylab = "Global Active Power (Killowats)", xlab = "")
points(hpc$diashoras, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$diashoras, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="tercero.png")
dev.off()

#4

par(mfrow = c(2,2))
plot(hpc$diashoras, hpc$Global_active_power, type = "l", ylab = "Global Active Power (Killowats)", xlab = "")
plot(hpc$diashoras, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(hpc$diashoras, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
points(hpc$diashoras, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$diashoras, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hpc$diashoras, hpc$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file="cuarto.png")
dev.off()


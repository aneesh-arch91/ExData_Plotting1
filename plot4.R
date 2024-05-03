png(filename='plot4.png')

options(scipen=999)
par(mfrow = c(2, 2))

plot(all_times, gap, ylab='Global Active Power (kilowatts)', type='l', xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))

plot(all_times, voltage, xlab='', ylab='Voltage', type='l', xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))

matplot(all_times, cbind(sub_metering1, sub_metering2, sub_metering3), col=c('black', 'red', 'blue'), xlab='', ylab='Energy sub metering', type='l', lty=1, xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "blue", "red"), lty = 1)

plot(all_times, grp, ylab='Global_reactive_power', type='l', xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))

dev.off()

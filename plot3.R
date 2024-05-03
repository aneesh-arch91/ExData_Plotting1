png(filename='plot3.png')

options(scipen=999)

# Multiple line plot for sub metering
matplot(all_times, cbind(sub_metering1, sub_metering2, sub_metering3), col=c('black', 'red', 'blue'), xlab='', ylab='Energy sub metering', type='l', lty=1, xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))

# Legend position and colors
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "blue", "red"), lty = 1)

dev.off()

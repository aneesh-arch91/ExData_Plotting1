png(filename='plot2.png')

options(scipen=999)
plot(all_times, gap, xlab='', ylab='Global Active Power (kilowatts)', type='l', xaxt='n')
axis(side=1, at=c(all_times[1], all_times[1440], all_times[2880]), labels=c('Thu', 'Fri', 'Sat'))

dev.off()

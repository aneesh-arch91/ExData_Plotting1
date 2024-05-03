png(filename='plot1.png')

options(scipen=999)
hist(df2$Global_active_power, freq=TRUE, col='red', main='Global Active Power', xlab='Global Active Power (kilowatts)', ylab='Frequency', xaxt='n')
axis(side=1, at=seq(0, 6, 2), labels=seq(0, 6, 2))

dev.off()

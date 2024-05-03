library(dplyr, warn.conflicts=FALSE)
library(data.table, warn.conflicts=FALSE)

# Reading the file and extraction
filename <- 'household_power_consumption.zip'
content <- paste0(substr(filename, 1, nchar(filename) - 4), '.txt')
if (!file.exists(filename) && !file.exists(content))
{
	download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', filename, method='curl')
}

if (file.exists(filename) && !file.exists(content))
{
	unzip(filename)
	file.remove(filename)
}

# Reading the csv file with semicolon
df1 <- read.csv(content, sep=';')

# Eliminating NA values and only including the two dates
df2 <- df1[(!is.na(df1$Global_active_power) & df1$Global_active_power != '?' & df1$Date %in% c('1/2/2007', '2/2/2007')),]

# Converting it to numeric
df2$Global_active_power <- sapply(df2$Global_active_power, as.numeric)

# First plot, uncomment the below line to exclude it
source('plot1.R')

# Combining time and date to get a unix timestamp
df2$Time <- paste(df2$Time, df2$Date, sep=' ')

df2$Time <- sapply(df2$Time, strptime, format='%T %d/%m/%Y')
df2$Time <- sapply(df2$Time, as.POSIXct)

all_times <- sort(unique(df2$Time))

gap <- c()

for (Time in all_times)
{
	gap <- append(gap, df2[(df2$Time == Time),]$Global_active_power)
}

# Second plot, uncomment the below line to exclude it
source('plot2.R')

df2 <- df2[(!is.na(df2$Sub_metering_1) & df2$Sub_metering_1 != '?'),]
df2 <- df2[(!is.na(df2$Sub_metering_2) & df2$Sub_metering_2 != '?'),]
df2 <- df2[(!is.na(df2$Sub_metering_3) & df2$Sub_metering_3 != '?'),]

df2$Sub_metering_1 <- sapply(df2$Sub_metering_1, as.numeric)
df2$Sub_metering_2 <- sapply(df2$Sub_metering_2, as.numeric)
df2$Sub_metering_3 <- sapply(df2$Sub_metering_3, as.numeric)

sub_metering1 <- c()
sub_metering2 <- c()
sub_metering3 <- c()

for (Time in all_times)
{
	sub_metering1 <- append(sub_metering1, df2[(df2$Time == Time),]$Sub_metering_1)
	sub_metering2 <- append(sub_metering2, df2[(df2$Time == Time),]$Sub_metering_2)
	sub_metering3 <- append(sub_metering3, df2[(df2$Time == Time),]$Sub_metering_3)
}

# Third plot, uncomment the below line to exclude it
source('plot3.R')

df2 <- df2[(!is.na(df2$Voltage) & df2$Voltage != '?'),]
df2$Voltage <- sapply(df2$Voltage, as.numeric)

voltage <- c()

for (Time in all_times)
{
	voltage <- append(voltage, df2[(df2$Time == Time),]$Voltage)
}

df2 <- df2[(!is.na(df2$Global_reactive_power) & df2$Global_reactive_power != '?'),]
df2$Global_reactive_power <- sapply(df2$Global_reactive_power, as.numeric)

grp <- c()

for (Time in all_times)
{
	grp <- append(grp, df2[(df2$Time == Time),]$Global_reactive_power)
}

# Fourth plot, uncomment the below line to exclude it
source('plot4.R')

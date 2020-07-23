######### Exploratory Data Analysis - Week 1 - Course Project ########

setwd("../ExData_Plotting1/")
getwd()



## Import data 

df_eletric <- read.table('household_power_consumption.txt', sep = ';', header = TRUE)
head(df_eletric)

## Witch class is the columns 
lapply(df_eletric,class)

df_eletric$Date <- as.Date(df_eletric$Date, tryFormats = "%d/%m/%Y")
df_eletric$Time < as.Date(df_eletric$Time, tryFormats = "%H:%M:%S")

## FIlter period  -> 2007-02-01 and 2007-02-02

df_filtered <- df_eletric[(df_eletric$Date >= "2007-02-01" & df_eletric$Date <= "2007-02-02"),]

##### Plot 4  ##### 

#English TimeZone
Sys.setlocale("LC_TIME", "English")
voltage <- as.numeric(df_filtered$Voltage)
Globalreactivepower <- as.numeric(df_filtered$Global_reactive_power)
weekdays =  as.POSIXct(paste(df_filtered$Date, df_filtered$Time, sep = " "))

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(weekdays,globalActivePower, type = "l", ylab="Global Active Power (kilowatts)",xlab = "" )
plot(weekdays,voltage, type = "l", ylab="Voltage",xlab = "datetime" )
plot(weekdays,Submetering1, type = "n", xlab = "" )
lines(weekdays,Submetering1)
lines(weekdays,Submetering2, col = 'red')
lines(weekdays,Submetering3, col = 'blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2",'Sub_metering_3'),col=c("black", "red",'blue'), lty=1, cex=0.6)
plot(weekdays,Globalreactivepower, type = "l", ylab="Global_reactive_power",xlab = "datetime" )
dev.off()


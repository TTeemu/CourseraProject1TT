## Exploratory Data Analys Project 1 ##
##               PLOT 4              ##
#######################################
## installing packages ##
install.packages("lubridate")
library(lubridate)
## Reading in the data ##

data <- read.table("household_power_consumption.txt",sep = ";",header = T,na.strings = "?")
# changing the variable class as date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Subsetting correct timeframe ##
cor_data  <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
# making weekday variable
cor_data$wday <- wday(cor_data$Date,label =T)

#removing the unused portion of data 
remove(data)

## Making the second plot ##
par(mfrow=c(2,2))
#png(file = "plot4.png", width = 480, height = 480,)
#plot1
plot(cor_data$Global_active_power,type="l",xaxt = "n",ylab = "Global Active Power (kilowatts)",xlab="")
axis(side=1, at=c(1,length(cor_data$Global_active_power)/2,length(cor_data$Global_active_power)),    labels=c("Thu","Fri","Sat"))
#plot2
plot(cor_data$Voltage,type="l",xaxt="n",lty=1,ylab="Voltage",xlab="datetime")
axis(side=1, at=c(1,length(cor_data$Global_active_power)/2,length(cor_data$Global_active_power)),    labels=c("Thu","Fri","Sat"))
#plot3
matplot(cor_data[,7:9],type="l",xaxt="n",lty=1,col=c("black","red","blue"),ylab="Energy sub metering")
axis(side=1, at=c(1,length(cor_data$Global_active_power)/2,length(cor_data$Global_active_power)),    labels=c("Thu","Fri","Sat"))
legend('topright', names(cor_data[7:9]), lty=1, col=c('black', 'red','blue'),bty = "n")
#plot4
plot(cor_data$Global_reactive_power,type="l",xaxt="n",yaxt = "n",lty=1,ylab="Global_reactive_power",xlab="datetime")
axis(side=2, at=seq(from=0,to=0.5,by=0.1))
axis(side=1, at=c(1,length(cor_data$Global_active_power)/2,length(cor_data$Global_active_power)),    labels=c("Thu","Fri","Sat"))
#dev.off()
par(mfrow=c(1,1))

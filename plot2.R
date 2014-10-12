## Exploratory Data Analys Project 1 ##
##               PLOT 2              ##
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
png(file = "plot2.png", width = 480, height = 480,)
plot(cor_data$Global_active_power,type="l",xaxt = "n",ylab = "Global Active Power (kilowatts)",xlab="")
axis(side=1, at=c(1,length(cor_data$Global_active_power)/2,length(cor_data$Global_active_power)),    labels=c("Thu","Fri","Sat"))
dev.off()

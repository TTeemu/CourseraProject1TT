## Exploratory Data Analys Project 1 ##
##               PLOT 1              ##
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

#removing the unused portion of data 
remove(data)

## Making the first plot ##
png(file = "plot1.png", width = 480, height = 480,)
hist(cor_data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

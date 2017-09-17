library(data.table)
library(lubridate)
library(dplyr)
HPC<-fread("household_power_consumption.txt",na.strings = "?")
the_two_days <- HPC %>% 
                mutate(DaT=dmy_hms(paste(Date, Time, sep=" "))) %>%               
                filter(DaT>=ymd_hms("2007-02-01 00:00:00"),DaT<ymd_hms("2007-02-03 00:00:00"))


hist(the_two_days$Global_active_power, main="Global Active Power", col="red", xlab='Global Active Power (kilowatts)')
dev.copy(png, file="plot1.png")
dev.off()


library(data.table)
library(lubridate)
library(dplyr)
library(tidyr)
HPC<-fread("household_power_consumption.txt",na.strings = "?")
the_two_days <- HPC %>% 
  mutate(DaT=dmy_hms(paste(Date, Time, sep=" "))) %>%               
  filter(DaT>=ymd_hms("2007-02-01 00:00:00"),DaT<ymd_hms("2007-02-03 00:00:00"))

sub_metering<-gather(the_two_days[,7:10], sub_metering_type, reads, -DaT)

plot(sub_metering$DaT,sub_metering$reads, type="n",col="black",xlab="",ylab="Energy sub metering")
points(sub_metering$DaT[sub_metering$sub_metering_type=="Sub_metering_1"],sub_metering$reads[sub_metering$sub_metering_type=="Sub_metering_1"], type="l",col="black",xlab="",ylab="Energy sub metering")
points(sub_metering$DaT[sub_metering$sub_metering_type=="Sub_metering_2"],sub_metering$reads[sub_metering$sub_metering_type=="Sub_metering_2"], type="l",col="red",xlab="",ylab="Energy sub metering")
points(sub_metering$DaT[sub_metering$sub_metering_type=="Sub_metering_3"],sub_metering$reads[sub_metering$sub_metering_type=="Sub_metering_3"], type="l",col="blue",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.copy(png, file="plot3.png")
dev.off()


loadData <- function() {
    #filter data at shell if data is too big or too slow at R
    #awk -F";" '$1 == "1/2/2007" || $1 == "2/2/2007"' "household_power_consumption.txt" > target.txt

    #install.packages(dplyr)
    library(dplyr)
    #install.packages(lubridate)
    library(lubridate)

    source("common.R")


    t <- read.table('./data/target.txt', sep = ';')
    colnames(t) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    str(t)
    t <- mutate(t, TimeStamp = dmy_hms(paste(Date, Time)))
    t <- mutate(t
               , Global_active_power = as.numeric(Global_active_power)
               , Global_reactive_power = as.numeric(Global_reactive_power)
               , Voltage = as.numeric(Voltage)
               , Global_intensity = as.numeric(Global_intensity)
               , Sub_metering_1 = as.numeric(Sub_metering_1)
               , Sub_metering_2 = as.numeric(Sub_metering_2)
               , Sub_metering_3 = as.numeric(Sub_metering_3)
               , wday = wday(TimeStamp, label = TRUE)
              )
    t
}
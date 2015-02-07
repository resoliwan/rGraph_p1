setwd('/Users/lee/machine/rGraph_p1')
source("common.R")


t <- loadData()
#quartz()
png("plot1.png", width=480, height=480,bg="white")
with(t, 
    hist(Global_active_power
        , col = "red"
        , main = "Global Actice Power"
        , xlab = "Global Active Power (kilowatts)"
        )
    )
dev.off()




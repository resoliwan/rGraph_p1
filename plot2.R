setwd('/Users/lee/machine/rGraph_p1')
source("common.R")

t <- loadData()
#quartz()
png("plot2.png", width=480, height=480,bg="white")

with(t,{
    plot(TimeStamp, Global_active_power
            , ylab = "Global Active Power(kilowatts)"
            , type = "l"
            , xaxt="n"
            , xlab=""
            )
    
    r <- round(range(TimeStamp), "day")
    axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")

})
dev.off()


setwd('/Users/lee/machine/rGraph_p1')
source("common.R")

t <- loadData()
#quartz()
png("plot4.png", width=480, height=480,bg="white")


par(mfrow = c(2,2))
#plot1 (1, 1)
with(t,{
    plot(TimeStamp, Global_active_power
            , ylab = "Global Active Power"
            , type = "l"
            , xaxt="n"
            , xlab=""
            )

    r <- round(range(TimeStamp), "day")
    axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")

})

#plot2 (1, 2)
with(t,{
    plot(TimeStamp, Voltage
            , ylab = "Voltage"
            , type = "l"
            , xaxt="n"
            , xlab="datatime"
            )

    r <- round(range(TimeStamp), "day")
    axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})

#plot3 (2, 1)
with(t,{
    plot(TimeStamp, Sub_metering_1
            , ylab = "Energy sub metering"
            , type = "n"
            , xaxt="n"
            , xlab=""
            )

    r <- round(range(TimeStamp), "day")
    axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})

with(t, lines(TimeStamp, Sub_metering_1, col = "black"))
with(t, lines(TimeStamp, Sub_metering_2, col = "red"))
with(t, lines(TimeStamp, Sub_metering_3, col = "blue"))

legend("topright", cex = 1, lwd = 2,   pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4 (2, 2)
with(t,{
    plot(TimeStamp, Global_reactive_power
            , type = "l"
            , xaxt="n"
            , xlab="datatime"
            )

    r <- round(range(TimeStamp), "day")
    axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})
dev.off()


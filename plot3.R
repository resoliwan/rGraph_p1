setwd('/Users/lee/machine/rGraph_p1')
source("common.R")

t <- loadData()
#quartz()
png("plot3.png", width=480, height=480,bg="white")

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
dev.off()


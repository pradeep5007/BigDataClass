library(moments)
library("lubridate")

Stocks <- read.csv("edx/RVDemo/FourStocks.csv", header=TRUE)
print(colMeans(Stocks[ , 2:5]))
print(apply(Stocks[ , 2:5], MARGIN=2, FUN=sd))
print(skewness(Stocks[ , 2:5]))
hist(Stocks$FMCG)

Stocks$Date <- as.Date(Stocks$Date, "%d-%b-%y")

Stocks$Month <- month(Stocks$Date)
Stocks$Year <- year(Stocks$Date)

View(Stocks)

write.csv(Stocks, "edx/RVDemo/NewStocks.csv")
cat("Created NewStocks.csv in",getwd(), "\n","You may open it as a spreadsheet!\n")

monthYearAvePharma <- aggregate(Pharma ~ Month + Year,data=Stocks,FUN=mean)
View(monthYearAvePharma) 

monthYearAvePharma <- aggregate(Steel ~ Month + Year,data=Stocks,FUN=mean)
View(monthYearAvePharma) 

mean(Stocks$Steel)

par(mfrow=c(1,2))
ts.Pharma <- ts(Stocks$Pharma)
plot(ts.Pharma,
     main="Actual Prices of Pharma Stock",
     col="navy", 
     ylab="Pharma (actual)")

ts.PharmaAvg <- ts(monthYearAvePharma$Pharma,
                   start=c(1995, 1), end=c(2014, 12),
                   frequency=12)
plot(ts.PharmaAvg,
     main="Aggregate Prices of Pharma Stock",
     col="darkred", 
     ylab="Pharma (aggregate)")

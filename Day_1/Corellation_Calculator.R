xValues <- seq(-1,1,0.01)
yValues <- xValues ^2

frame <- data.frame(xValues,yValues)
View(frame)
plot(xValues,yValues,type="l")

cat ( "Corr", cor(yValues,xValues),"\n")

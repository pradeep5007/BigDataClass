Flights <- read.csv("edx/HR_Analytics/Dec2014Flights.csv", header=TRUE)

# Declare variables as categorical
Flights$FL_NUM <- factor(Flights$FL_NUM)
Flights$CANCELLED <- factor(Flights$CANCELLED)
Flights$DIVERTED <- factor(Flights$DIVERTED)

# Declare each of these variables as numerical
Flights$CRS_DEP_TIME <- as.numeric(Flights$CRS_DEP_TIME)
Flights$DEP_DELAY <- as.numeric(Flights$DEP_DELAY)
Flights$CRS_ARR_TIME <- as.numeric(Flights$CRS_ARR_TIME)
Flights$ARR_DELAY <- as.numeric(Flights$ARR_DELAY)
Flights$DISTANCE <- Flights$DISTANCE

diverted <- subset(Flights, DIVERTED == 1)
cancelled <- subset(Flights, CANCELLED == 1)

hist(cancelled$DISTANCE, breaks=20)
hist(diverted$DISTANCE, breaks=20)

flightsByDayOfWeek <- table(cancelled$DAY_OF_WEEK)
print(flightsByDayOfWeek)


divertedflightsByDayOfWeek <- table(diverted$DAY_OF_WEEK)
print(divertedflightsByDayOfWeek)

FlightsByCarrierByDay <- xtabs(~ CARRIER + DAY_OF_WEEK, data=Flights)

aggregate(Flights$DISTANCE, by=list(Flights$CARRIER), FUN=median)

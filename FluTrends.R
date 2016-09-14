######################################################
# Google Flu Trends Analysis
######################################################

# Need a transparent background to your plot?
# Uncomment this line
par(bg="NA") 

# Install these packages before you run the code!
library(lubridate) # For date type manipulation
library(zoo) # For time series manipulation

# Read in 2009-10 data for US. The first 11 rows of
# this dataset is a description of what it is
Dataset <- read.csv("Trends.csv", 
                    header=TRUE)

# Coerce the column to behave like a Date type
Dataset$Date <- as.Date(Dataset$Date, 
                        "%Y-%m-%d")

# The second column contains US level data
# We pick two columns - Date & # of Searches
# and construct a time series object
USData <- Dataset[ , c(1, 2)]

# Declare USData as a time series
USData.ts <- zoo(USData$United.States, 
                order.by=USData$Date)

# Plot away, with a grid to help us
plot(USData.ts,
     main="Google Predicted Trends in Flu",
     lwd=2,
     col="blue",
     xlab="Year", ylab="Estimated ILI Cases/ 100,000")
grid (NULL,NULL, lty = 6, col = "cornsilk2") 

################################################
# Demonstrate properties of Adjacency Matrix
################################################
options(scipen=7, "digits"=2)

# Order of the matrix
n <- 9  # no. of vertices
m <- 10 # no. of edges
  
# Begin with the undirected version
# Initialise everything to zero, given 
# that the matrix is sparse
AU <- matrix(0, nrow=9, ncol=9)

# Now indicate which elements are 1
# By symmetry, # of edges is half
AU[1, 2] <- 1; AU[2, 1] <- 1
AU[2, 3] <- 1; AU[3, 2] <- 1
AU[2, 4] <- 1; AU[4, 2] <- 1
AU[3, 4] <- 1; AU[4, 3] <- 1
AU[4, 5] <- 1; AU[5, 4] <- 1
AU[4, 7] <- 1; AU[7, 4] <- 1
AU[5, 6] <- 1; AU[6, 5] <- 1
AU[6, 7] <- 1; AU[7, 6] <- 1
AU[6, 8] <- 1; AU[8, 6] <- 1
AU[8, 9] <- 1; AU[9, 8] <- 1

# Next, move to the Directed version
AD <- matrix(0, nrow=9, ncol=9)

# Put in the directed edges
# Careful about the directions!
AD[2, 1] <- 1
AD[3, 2] <- 1; AD[4, 2] <- 1; AD[6, 2] <- 1
AD[4, 3] <- 1
AD[5, 4] <- 1; AD[7, 4] <- 1
AD[5, 6] <- 1
AD[4, 7] <- 1
AD[6, 7] <- 1
AD[8, 6] <- 1
AD[9, 8] <- 1

################################################
# Function to compute Matrix Power
################################################
matPower <- function(A, k) {
  
  Power <- A
  for(i in 1:(k - 1)) {
    Power <- Power %*% A
  }
  return(Power)
}

# For the number of 2-loops
ADSq <- matPower(AD, 2)
View(ADSq)

# Co-citation & Bibliographic Coupling
CCN <- AD %*% t(AD)
BBC <- t(AD) %*% AD

View(CCN)
View(BBC)

# Get eigenvalues and eigenvectors of
# the adjacency matrix for directed
eigenAD <- eigen(AD)
cat("Here's the spectrum of AD:\n\n")
cat("Eigenvalues:\n",
    round(eigenAD$values, 3), "\n")
eVecs <- round(eigenAD$vectors, 3)
cat("\nHere are the eigenvectors...\n")
print(eVecs)

eValsAD <- eigenAD$values
numLoops2 <- sum(eValsAD^2)

cat("\n# of 2-loops in the directed network:",
    numLoops2, "\n")


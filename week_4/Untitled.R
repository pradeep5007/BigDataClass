# Install this package if you haven't already
library(igraph)

# Ready edge information from a file
Edges <- read.csv("Week_4/1516035_Answers3.csv", header=TRUE)

# Construct the graph
Karate <- graph.data.frame(Edges, 
                           directed=TRUE)

# Let's see what the adjacency matrix looks like
matrixKarate <- get.adjacency(Karate, 
                              sparse=FALSE)
View(matrixKarate)

# Try a better plotting routine
tkplot(Karate)


# Construct the graph
Karate <- graph.data.frame(Edges, 
                           directed=TRUE)

# Let's see what the adjacency matrix looks like
matrixKarate <- get.adjacency(Karate, 
                              sparse=FALSE)
View(matrixKarate)

# Try a better plotting routine
tkplot(Karate)


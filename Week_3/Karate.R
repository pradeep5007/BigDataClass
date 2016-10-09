# Install this package if you haven't already
library(igraph)

# Ready edge information from a file
Edges <- read.csv("Week_3/karate.csv", header=TRUE)

# Construct the graph
Karate <- graph.data.frame(Edges, 
                           directed=FALSE)

# Function to print something "nicely"
prettyPrint <- function(announce, input) {
  cat("********************************************\n",
      announce, ":\n\n")
  print(input)
}

# Start inspecting
prettyPrint("Here are the vertices of this network",
            V(Karate))
prettyPrint("Here are the edges of this network",
            E(Karate))

cat("\nDirectly plotting is not very useful!\n")
par(mfrow=c(1, 3))
plot(Karate, 
     main="Direct plot")
plot(Karate, 
     main="With Fruchterman Reingold",
     layout = layout.fruchterman.reingold,
     vertex.size = 25,
     vertex.color="red",
     vertex.frame.color= "darkred",
     vertex.label.color = "white",
     vertex.label.family = "sans",
     edge.width=2,  
     edge.color="black")
#l <- layout.kamada.kawai
plot(Karate, 
     main="With Kamada Kawai",
     layout = layout.kamada.kawai,
     vertex.size = 25,
     vertex.color="yellow",
     vertex.frame.color= "darkgreen",
     vertex.label.color = "black",
     vertex.label.family = "sans",
     edge.width=2,  
     edge.color="black")



# Let's see what the adjacency matrix looks like
matrixKarate <- get.adjacency(Karate, 
                              sparse=FALSE)
View(matrixKarate)

# Try a better plotting routine
tkplot(Karate)

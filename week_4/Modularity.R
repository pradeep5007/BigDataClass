library(igraph)

# Here's a simple way to build a graph
g <- graph_from_literal( 1--2, 4--5, 3--1, 5--2, 4--3 )
print(g)
plot(g)

# Convert the graph into the adjacency matrix
adj <- as_adj(g)
print(adj)

# Calculate modularity for a partition in which
# Nodes 1, 3 & 5 are in Module 1, and 
# Nodes 2 & 4 are in Module 2
membership <- c(1,2,1,2,1)
print(modularity(g, membership))
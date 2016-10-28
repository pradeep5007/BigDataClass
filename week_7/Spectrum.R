# Spectral decomposition of a matrix
A <- matrix(c(2, 3, 3, 1), nrow=2,
            byrow=TRUE)
cat("Here's the matrix A:\n\n")
print(A)

cat("\nHere's the Spectrum of A:\n\n")
print(eigen(A), digits=3)
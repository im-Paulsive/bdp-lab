# Load dataset from CSV
data <- read.csv("data.csv")

# Keep only numeric columns (important for clustering)
data <- data[sapply(data, is.numeric)]

# Take number of clusters from user
k <- as.integer(readline(prompt = "Enter number of clusters (k): "))

# Take initial centers from user
cat("Enter initial centers (row-wise):\n")

centers <- matrix(nrow = k, ncol = ncol(data))

for (i in 1:k) {
  cat(paste("Center", i, ":\n"))
  for (j in 1:ncol(data)) {
    value <- as.numeric(readline(
      prompt = paste("Enter value for", colnames(data)[j], ": ")
    ))
    centers[i, j] <- value
  }
}

# Convert to data frame
centers <- as.data.frame(centers)
colnames(centers) <- colnames(data)

# Apply K-Means with user-defined centers
kmeans_result <- kmeans(data, centers = centers)

# Output results
cat("\nCluster Assignments:\n")
print(kmeans_result$cluster)

cat("\nCluster Centers:\n")
print(kmeans_result$centers)

cat("\nNumber of iterations:\n")
print(kmeans_result$iter)

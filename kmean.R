# Sample dataset
data <- data.frame(
  x = c(1,2,1.5,8,9,8.5,1,9),
  y = c(2,1,1.8,8,9,8.2,0.6,11)
)

# Display dataset
print(data)

# Apply K-Means Clustering
# k = 2 clusters
kmeans_result <- kmeans(data, centers = 2)

# Cluster assignments
print("Cluster Assignment")
print(kmeans_result$cluster)

# Cluster centers
print("Cluster Centers")
print(kmeans_result$centers)

# -----------------------------
# Visualization
# -----------------------------

# Plot clusters
plot(data$x,
     data$y,
     col = kmeans_result$cluster,
     pch = 19,
     cex = 2,
     xlab = "X",
     ylab = "Y",
     main = "K-Means Clustering")

# Plot cluster centers
points(kmeans_result$centers,
       col = 1:2,
       pch = 8,
       cex = 4,
       lwd = 3)

# Add text labels
# text(data$x,
#      data$y,
#      labels = kmeans_result$cluster,
#      pos = 3)

# Add legend
legend("topleft",
       legend = c("Cluster 1",
                  "Cluster 2",
                  "Centroids"),
       col = c(1,2,"black"),
       pch = c(19,19,8))

cat("\nCluster Centers:\n")
print(kmeans_result$centers)

cat("\nNumber of iterations:\n")
print(kmeans_result$iter)

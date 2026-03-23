# Load libraries
library(rpart)
library(e1071)
library(rpart.plot)   # added for plotting

# Load dataset
data <- read.csv("bill_authentication.csv")

# Convert target to factor
data$Class <- as.factor(data$Class)

# Split data
set.seed(123)
index <- sample(1:nrow(data), 0.7 * nrow(data))

train_data <- data[index, ]
test_data  <- data[-index, ]

# -------------------- Decision Tree --------------------
dt_model <- rpart(Class ~ ., data = train_data, method = "class")
dt_pred <- predict(dt_model, test_data, type = "class")

# ----------- Added Plot -----------
rpart.plot(dt_model)")

# -------------------- SVM --------------------
# Scale data
train_scaled <- train_data
test_scaled  <- test_data

train_scaled[, -ncol(train_scaled)] <- scale(train_scaled[, -ncol(train_scaled)])
test_scaled[, -ncol(test_scaled)]  <- scale(test_scaled[, -ncol(test_scaled)])

svm_model <- svm(Class ~ ., data = train_scaled, kernel = "linear")
svm_pred <- predict(svm_model, test_scaled)

# -------------------- Random 5 samples --------------------
set.seed(123)
sample_index <- sample(1:nrow(test_data), 5)

# -------- Decision Tree Results --------
cat("\nDecision Tree - 5 Random Samples:\n")

dt_results <- data.frame(
  Variance  = test_data$Variance[sample_index],
  Skewness  = test_data$Skewness[sample_index],
  Curtosis  = test_data$Curtosis[sample_index],
  Entropy   = test_data$Entropy[sample_index],
  Actual    = test_data$Class[sample_index],
  Predicted = dt_pred[sample_index]
)

print(dt_results)

# -------- SVM Results --------
cat("\nSVM - 5 Random Samples:\n")

svm_results <- data.frame(
  Variance  = test_data$Variance[sample_index],
  Skewness  = test_data$Skewness[sample_index],
  Curtosis  = test_data$Curtosis[sample_index],
  Entropy   = test_data$Entropy[sample_index],
  Actual    = test_data$Class[sample_index],
  Predicted = svm_pred[sample_index]
)

print(svm_results)

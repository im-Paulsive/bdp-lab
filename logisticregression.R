# Load dataset from CSV file
data <- read.csv("raisin.csv")   # Reads the dataset into a dataframe

# View first few rows of the dataset
head(data)   # Displays first 6 rows to understand structure

# Convert target variable 'Class' into factor (categorical)
data$Class <- as.factor(data$Class)   # Required for classification

# Split into training and testing data (70-30 split)
set.seed(123)   # Fixes randomness so results are reproducible

index <- sample(1:nrow(data), 0.7 * nrow(data))  
# Randomly selects 70% row indices for training

train_data <- data[index, ]   
# Training dataset (70%)

test_data  <- data[-index, ]  
# Testing dataset (remaining 30%)

# Fit Logistic Regression Model
model <- glm(Class ~ ., data = train_data, family = binomial)  
# Builds model: predict Class using all other variables

# Summary of model
summary(model)  
# Shows coefficients, significance, and model details

# Predict probabilities on test data
prob <- predict(model, test_data, type = "response")  
# Gives probability of belonging to one class (values between 0 and 1)

# Convert probabilities to class labels (threshold = 0.5)
predicted_class <- ifelse(prob > 0.5, levels(data$Class)[2], levels(data$Class)[1])  
# If probability > 0.5 → assign class 2, else class 1

# Confusion Matrix
table(Predicted = predicted_class, Actual = test_data$Class)  
# Compares predicted vs actual classes

# Accuracy calculation
accuracy <- mean(predicted_class == test_data$Class)  
# Calculates proportion of correct predictions

# Print accuracy
print(paste("Accuracy:", accuracy))  
# Displays model accuracy

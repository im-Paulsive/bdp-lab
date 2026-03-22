# Load dataset
data <- read.csv("data.csv")

# Train model
model <- lm(Y ~ ., data = data)

# Take user input (example for 2 variables X1 and X2)
x1 <- as.numeric(readline(prompt = "Enter value for X1: "))
x2 <- as.numeric(readline(prompt = "Enter value for X2: "))

# Create new data frame with user input
new_data <- data.frame(X1 = x1, X2 = x2)

# Predict Y
predicted_y <- predict(model, new_data)

# Display result
cat("Predicted Y value:", predicted_y, "\n")

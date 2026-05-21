# Create dataset
data <- data.frame(
  Age = c(22,25,47,52,46,56,48,55,60,62),
  Salary = c(25000,30000,50000,60000,52000,
             65000,58000,70000,72000,80000),
  Purchased = c(0,0,1,1,1,1,1,1,1,1)
)

# Split into train and test
trainindex <- sample(
  1:nrow(data),
  0.8 * nrow(data)
)

train <- data[trainindex, ]
test <- data[-trainindex, ]

# Logistic Regression Model
model <- glm(
  Purchased ~ Age + Salary,
  data = train,
  family = binomial
)

# Model summary
summary(model)

# Prediction
pred <- predict(
  model,
  newdata = test,
  type = "response"
)

# Convert probability to class
class <- ifelse(pred > 0.5, 1, 0)

# Output dataframe
out <- data.frame(
  Age = test$Age,
  Salary = test$Salary,
  Actual = test$Purchased,
  Predicted = class
)

print(out)

# -----------------------------------
# Visualization
# -----------------------------------

# Plot training data
plot(
  train$Age,
  train$Salary,
  col = train$Purchased + 1,
  pch = 19,
  main = "Logistic Regression",
  xlab = "Age",
  ylab = "Salary"
)

# Add test points
points(
  test$Age,
  test$Salary,
  col = "black",
  pch = 8,
  cex = 2
)

# Add legend
legend(
  "topleft",
  legend = c(
    "Class 0",
    "Class 1",
    "Test Data"
  ),
  col = c(1,2,"black"),
  pch = c(19,19,8)
)

library(dplyr)

# Set up
age <- c(25, 34, 28, 52)
status <- c("Poor", "Improved", "Excellent", "Poor")
incomedata <- data.frame(age, status)

# Expected result
expected<- tribble(
  ~status, ~age,
  "Excellent", 28,
  "Improved", 34,
  "Poor",38.5)


set.seed(123)  # Ensuring reproducibility

# Generate months & years
years <- rep(c(2023, 2024), each = 12)
months <- rep(1:12, times = 2)  # 1-12 repeated for two years
month_names <- rep(month.name, times = 2)  # Month names repeated

# Fixed salary per month
salary <- 80000  

# Expense categories
categories <- c("Rent", "Groceries", "Utilities", "Entertainment", "Dining", 
                "Shopping", "OTT Subscription", "Newspaper", "Gym Membership")

# Create empty dataframe
finance_data <- data.frame()

# Loop through each month to generate transactions
for (i in 1:length(years)) {
  
  # Salary Transaction (1 per month)
  salary_df <- data.frame(
    Year = years[i],
    MonthNumber = months[i],
    Day = sample(1:5, 1),  # Assume salary is credited in the first 5 days
    MonthName = month_names[i],
    Transaction_Type = "Income",
    Description = "Monthly Salary",
    Category = "Salary",
    Amount = salary
  )
  
  # Number of expenses per month (random 7-9)
  num_expenses <- sample(7:9, 1)  
  selected_categories <- sample(categories, num_expenses, replace = FALSE)  
  
  # Generate random expenses while ensuring total stays within ₹40,000 - ₹50,000
  total_expense <- sample(40000:50000, 1)
  expense_distribution <- round(runif(num_expenses, min = total_expense * 0.05, max = total_expense * 0.25))
  
  # Normalize expenses to match total_expense
  expense_distribution <- round(expense_distribution / sum(expense_distribution) * total_expense)
  
  # Adjust last expense to ensure total matches exactly
  expense_distribution[length(expense_distribution)] <- total_expense - sum(expense_distribution[-length(expense_distribution)])
  
  # Generate expense transactions
  expense_df <- data.frame(
    Year = rep(years[i], num_expenses),
    MonthNumber = rep(months[i], num_expenses),
    Day = sample(1:28, num_expenses, replace = TRUE),  # Avoid month-end issues
    MonthName = rep(month_names[i], num_expenses),
    Transaction_Type = "Expense",
    Description = paste("Expense for", selected_categories),
    Category = selected_categories,
    Amount = expense_distribution
  )
  
  # Append to main dataframe
  finance_data <- rbind(finance_data, salary_df, expense_df)
}

# Save to CSV
write.csv(finance_data, "PersonalFinanceData.csv", row.names = FALSE)

# Display first few rows
head(finance_data)


odbc::odbcListDrivers()

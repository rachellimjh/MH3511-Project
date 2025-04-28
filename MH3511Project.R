# Load the CSV file containing coffee data into a dataframe
coffee_data <- read.csv("/Users/Lenovo/Desktop/Suki/Uni/MH3511/coffee.csv")

#Data Cleaning
#Remove unwanted columns
coffee_data<-coffee_data[,-16:-19,]#remove columns 16-19 from the dataframe
coffee_data<-coffee_data[,-9,]#remove 9th column
coffee_data<-coffee_data[,-1,]#remove 1st column
coffee_data<-coffee_data[!duplicated(coffee_data),]

#add new column for id
coffee_data$id<-seq(1,nrow(coffee_data),1)
coffee_data_profit<-coffee_data
coffee_data_sales<-coffee_data

#Analysis of sales and profits column

#Profit column
boxplot(coffee_data$Profit, main ="Profit Boxplot")
qqnorm(coffee_data$Profit, main = "Normal Q-Q Plot for Profits")
qqline(coffee_data$Profit, col="blue")
hist(coffee_data$Profit, main = "Histogram of Profit")
xpt<-seq(-700,700,by=10)
n_den<-dnorm(xpt,mean(coffee_data$Profit),sd(coffee_data$Profit))
ypt<-n_den*length(coffee_data$Profit)*100
lines(xpt,ypt,col="red")
#removing of outliers using boxplot rule
coffee_data_profit<-coffee_data[coffee_data$Profit>=quantile(coffee_data$Profit,0.25)-1.5*IQR(coffee_data$Profit)&quantile(coffee_data$Profit,0.75)+1.5*IQR(coffee_data$Profit)>= coffee_data$Profit,]
hist(coffee_data_profit$Profit, main = "Histogram of Cleaned Profit")
xpt<-seq(-100,200,by=1)
n_den<-dnorm(xpt,mean(coffee_data_profit$Profit),sd(coffee_data_profit$Profit))
ypt<-n_den*length(coffee_data_profit$Profit)*20
lines(xpt,ypt,col="red")
boxplot(coffee_data_profit$Profit, main ="Cleaned Profit Boxplot")
summary(coffee_data_profit$Profit)

#Sales Column
boxplot(coffee_data$Sales, main ="Sales Boxplot")
qqnorm(coffee_data$Sales, main = "Normal Q-Q Plot for Sales")
qqline(coffee_data$Sales, col="blue")
hist(coffee_data$Sales, main = "Histogram of Sales")
xpt<-seq(0,600,by=10)
n_den<-dnorm(xpt,mean(coffee_data$Sales),sd(coffee_data$Sales))
ypt<-n_den*length(coffee_data$Sales)*50
lines(xpt,ypt,col="red")
#apply log transformation for Sales
coffee_data$Sales<-log(coffee_data$Sales)
hist(coffee_data$Sales)
xpt<-seq(3,6.5,by=0.05)
n_den<-dnorm(xpt,mean(coffee_data$Sales),sd(coffee_data$Sales))
ypt<-n_den*length(coffee_data$Sales)*0.5
lines(xpt,ypt,col="red")
#remove outliers for Sales
coffee_data_sales<-coffee_data[coffee_data$Sales>=quantile(coffee_data$Sales,0.25)-1.5*IQR(coffee_data$Sales)&quantile(coffee_data$Sales,0.75)+1.5*IQR(coffee_data$Sales)>= coffee_data$Sales,]
hist(coffee_data_sales$Sales, main="log(Sales) Histogram")

xpt<-seq(3,7,by=0.05)
n_den<-dnorm(xpt,mean(coffee_data_sales$Sales),sd(coffee_data_sales$Sales))
ypt<-n_den*length(coffee_data_sales$Sales)*.2
lines(xpt,ypt,col="red")

boxplot(coffee_data_sales$Sales, main="log(Sales) Boxplot")
summary(coffee_data_sales$Sales)

#Cogs Column
boxplot(coffee_data$Cogs, main ="COGS Boxplot")
hist(coffee_data$Cogs, main = "Histogram of COGS")
xpt<-seq(0,300,by=10)
n_den<-dnorm(xpt,mean(coffee_data$Cogs),sd(coffee_data$Cogs))
ypt<-n_den*length(coffee_data$Cogs)*10
lines(xpt,ypt,col="red")

#remove 0 value
coffee_data <- coffee_data[coffee_data$Cogs!=0,]

#remove NA values
coffee_data<-coffee_data[!is.na(coffee_data$Cogs),]

#log transformation for COGS
coffee_data$Cogs<-log(coffee_data$Cogs)
hist(coffee_data$Cogs, main ="Histogram of COGs")
xpt<-seq(2,6,by=0.05)
n_den<-dnorm(xpt,mean(coffee_data$Cogs),sd(coffee_data$Cogs))
ypt<-n_den*length(coffee_data$Cogs)*0.5
lines(xpt,ypt,col="red")

#remove outliers for COGS
coffee_data_cogs<-coffee_data[coffee_data$Cogs>=quantile(coffee_data$Cogs,0.25)-1.5*IQR(coffee_data$Cogs)&quantile(coffee_data$Cogs,0.75)+1.5*IQR(coffee_data$Cogs)>= coffee_data$Cogs,]
hist(coffee_data_cogs$Cogs, main="Histogram of cleaned log(COGs)")
xpt<-seq(2.5,6,by=0.01)
n_den<-dnorm(xpt,mean(coffee_data_cogs$Cogs),sd(coffee_data_cogs$Cogs))
ypt<-n_den*length(coffee_data_cogs$Cogs)*0.1
lines(xpt,ypt,col="red")
boxplot(coffee_data_cogs$Cogs, main="Boxplot of cleaned log(COGS)")
summary(coffee_data_cogs$Cogs)

#variables in coffee_data_cogs = 1038

#Difference Column
boxplot(coffee_data$DifferenceBetweenActualandTargetProfit, main ="Difference Boxplot")
hist(coffee_data$DifferenceBetweenActualandTargetProfit, main = "Histogram of Difference")
xpt<-seq(-700,700,by=10)
n_den<-dnorm(xpt,mean(coffee_data$DifferenceBetweenActualandTargetProfit),sd(coffee_data$DifferenceBetweenActualandTargetProfit))
ypt<-n_den*length(coffee_data$DifferenceBetweenActualandTargetProfit)*100
lines(xpt,ypt,col="red")

#remove outliers for difference
coffee_data_difference<-coffee_data[coffee_data$DifferenceBetweenActualandTargetProfit>=quantile(coffee_data$DifferenceBetweenActualandTargetProfit,0.25)-1.5*IQR(coffee_data$DifferenceBetweenActualandTargetProfit)&quantile(coffee_data$DifferenceBetweenActualandTargetProfit,0.75)+1.5*IQR(coffee_data$DifferenceBetweenActualandTargetProfit)>= coffee_data$DifferenceBetweenActualandTargetProfit,]
hist(coffee_data_difference$DifferenceBetweenActualandTargetProfit, main="Difference Histogram")
boxplot(coffee_data_difference$DifferenceBetweenActualandTargetProfit, main="Difference Boxplot")
summary(coffee_data_difference$DifferenceBetweenActualandTargetProfit)

#930 variables left for difference


#Inventory Margin
boxplot(coffee_data$Inventory.Margin, main ="Inventory Margin Boxplot")
hist(coffee_data$Inventory.Margin, main = "Histogram of Inventory Margin")
xpt<-seq(-4000,6000,by=10)
n_den<-dnorm(xpt,mean(coffee_data$Inventory.Margin),sd(coffee_data$Inventory.Margin))
ypt<-n_den*length(coffee_data$Inventory.Margin)*1000
lines(xpt,ypt,col="red")

#cannot apply log transformation for inventory margin as there are negative values



#remove outliers for inventory margin
coffee_data_inventory_margin<-coffee_data[coffee_data$Inventory.Margin>=quantile(coffee_data$Inventory.Margin,0.25)-1.5*IQR(coffee_data$Inventory.Margin)&quantile(coffee_data$Inventory.Margin,0.75)+1.5*IQR(coffee_data$Inventory.Margin)>= coffee_data$Inventory.Margin,]
hist(coffee_data_inventory_margin$Inventory.Margin, main="Inventory Margin Histogram")  
boxplot(coffee_data_inventory_margin$Inventory.Margin, main="Inventory Margin Boxplot")
summary(coffee_data_inventory_margin$Inventory.Margin)

#930 variables left for inventory margin

#Margin Column
boxplot(coffee_data$Margin, main ="Margin Boxplot")
hist(coffee_data$Margin, main = "Histogram of Margin")
xpt<-seq(-200,400,by=10)
n_den<-dnorm(xpt,mean(coffee_data$Margin),sd(coffee_data$Margin))
ypt<-n_den*length(coffee_data$Margin)*100
lines(xpt,ypt,col="red")

#remove outliers
coffee_data_margin<-coffee_data[coffee_data$Margin>=quantile(coffee_data$Margin,0.25)-1.5*IQR(coffee_data$Margin)&quantile(coffee_data$Margin,0.75)+1.5*IQR(coffee_data$Margin)>= coffee_data$Margin,]
hist(coffee_data_margin$Margin, main="Margin Histogram")
boxplot(coffee_data_margin$Margin, main="Margin Boxplot")
summary(coffee_data_margin$Margin)

#margin df 948 variables left

#Total Expenses column
boxplot(coffee_data$Total_expenses, main ="Total Expenses Boxplot")
hist(coffee_data$Total_expenses, main = "Histogram of Total Expenses")
xpt<-seq(0,150,by=1)
n_den<-dnorm(xpt,mean(coffee_data$Total_expenses),sd(coffee_data$Total_expenses))
ypt<-n_den*length(coffee_data$Total_expenses)*10
lines(xpt,ypt,col="red")


#log transformation for total expenses
coffee_data$Total_expenses<-log(coffee_data$Total_expenses)


#remove outliers for total expenses
coffee_data_total_expenses<-coffee_data[coffee_data$Total_expenses>=quantile(coffee_data$Total_expenses,0.25)-1.5*IQR(coffee_data$Total_expenses)&quantile(coffee_data$Total_expenses,0.75)+1.5*IQR(coffee_data$Total_expenses)>= coffee_data$Total_expenses,]
hist(coffee_data_total_expenses$Total_expenses, main="Total Expenses Histogram")
xpt<-seq(1,1.6,by=0.01)
n_den<-dnorm(xpt,mean(coffee_data_total_expenses$Total_expenses),sd(coffee_data_total_expenses$Total_expenses))
ypt<-n_den*length(coffee_data_total_expenses$Total_expenses)*0.05
lines(xpt,ypt,col="red")
boxplot(coffee_data_total_expenses$Total_expenses, main="Boxplot of Total Expenses ")
summary(coffee_data_total_expenses$Total_expenses) 

#variables left 988

#merge profit and sales
merged_coffee_data<-merge(coffee_data_profit,coffee_data_sales,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

#merge with cogs
merged_coffee_data<-merge(merged_coffee_data,coffee_data_cogs,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

#merge with difference
merged_coffee_data<-merge(merged_coffee_data,coffee_data_difference,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

#merge with inventory margin
merged_coffee_data<-merge(merged_coffee_data,coffee_data_inventory_margin,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

#merge with margin
merged_coffee_data<-merge(merged_coffee_data,coffee_data_margin,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

#merge with total expenses
merged_coffee_data<-merge(merged_coffee_data,coffee_data_total_expenses,by="id")
merged_coffee_data<-subset(merged_coffee_data, select = c("id","Cogs.x", "DifferenceBetweenActualandTargetProfit.x","Date.x", "Inventory.Margin.x","Margin.x", "Market_size.x","Market.x", "Product_line.x", "Product_type.x", "Product.x", "Profit.x", "Sales.x", "State.x", "Total_expenses.x", "Type.x"))

colnames(merged_coffee_data) <- c("id", "Cogs","DifferenceBetweenActualandTargetProfit","Date", "Inventory.Margin","Margin", "Market_size","Market", "Product_line", "Product_type", "Product", "Profit", "Sales", "State", "Total_expenses", "Type")
#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#PRODUCTLINE-TYPE
#Combine the abbreviated words into a new variable named combined_category
# Create combined productLine-Type variable
merged_coffee_data$productLine_type <- paste(merged_coffee_data$Product_line,
                                             merged_coffee_data$Type,
                                             sep = "_")
# Count frequencies
productLine_type <- table(merged_coffee_data$productLine_type)
# Plot a bar plot with larger margins and specified colors
barplot(productLine_type, 
        main = "Combined productLine-Type Variables", 
        ylab = "Frequency")

#------------------------------------------------------------
#plot DifferenceBetweenActualandTargetProfit(small and large markets) against Sales
# Define custom colors for small and large markets
small_market_color <- "#FF6347"  # Tomato color for small market
large_market_color <- "#4682B4"  # Steel Blue color for large market
# Create a boxplot of Sales by Market_size
boxplot(merged_coffee_data$DifferenceBetweenActualandTargetProfit ~ merged_coffee_data$Market_size, 
        main = "Diff by Market_size", 
        ylab = "Difference Between Actual and Target Profit", 
        xlab = "Market_size", 
        col = c(small_market_color, large_market_color),
        cex.axis = 0.7)  # Reduce font size of x-axis labels

var.test(merged_coffee_data$DifferenceBetweenActualandTargetProfit ~ merged_coffee_data$Market_size)
t.test(merged_coffee_data$DifferenceBetweenActualandTargetProfit ~ merged_coffee_data$Market_size)
#------------------------------------------------------------
#PRODUCTTYPE-PRODUCT
# Abbreviate Product_type and Product to four letters
abbreviated_product_type <- substr(merged_coffee_data$Product_type, 1, 4)
abbreviated_product <- substr(merged_coffee_data$Product, 1, 5)
# Combine the abbreviated words into a new variable named combined_category
merged_coffee_data$productType_product <- paste(abbreviated_product_type,
                                         abbreviated_product,
                                         sep = "_")
productType_product = table(merged_coffee_data$productType_product)
# Set larger margin size
par(mar = c(5, 8, 4, 2))  # Adjust the right margin to fit longer labels
barplot(productType_product, 
        main = "Combined productType_product Variables", 
        ylab = "Frequency",
        las = 2,
        cex.names = 0.7)  # Rotate y-axis labels vertically

#------------------------------------------------------------
#Relation between Sales and ProductLine-Type
#summary stats
summary_prodLine_type <- aggregate(merged_coffee_data$Sales, by = list(merged_coffee_data$productLine_type), FUN = summary)
# Define custom colors for coffee and tea types
coffee_colors <- c("#8B4513", "#A0522D")  # Brown and Sienna colors for coffee
tea_colors <- c("#008000", "#3CB371")     # Green and Medium Sea Green colors for tea
#visualise the data against sales
boxplot(merged_coffee_data$Sales ~ merged_coffee_data$productLine_type, 
        main = "Profit by ProductLine-Type",
        ylab = "log(Sales)",
        xlab = "ProductLine-Type",
        col = c(coffee_colors, tea_colors),
        cex.axis = 0.7)  # Reduce font size of x-axis labels

#ANOVA test
anova_prodLine_type <- aov(merged_coffee_data$Sales ~ factor(merged_coffee_data$productLine_type))
summary(anova_prodLine_type)
#------------------------------------------------------------
# Relation between Profit and ProductType-Product
# Summary stats
summary_prodType_product <- aggregate(merged_coffee_data$Sales, by = list(merged_coffee_data$productType_product), FUN = summary)
any(is.na(merged_coffee_data$productType_product))
any(!is.numeric(merged_coffee_data$productType_product))
unique(merged_coffee_data$productType_product)
# Define coffee and tea colors
coffee_colors <- c("#4A2C21", "#8B4513", "#654321", "#3E2723", "#6D4C41", "#5D4037")
tea_colors <- c("#6B8E23", "#556B2F", "#8FBC8F", "#2E8B57", "#3CB371", "#20B2AA")
# Get unique values in the productType_product column
unique_values <- unique(merged_coffee_data$productType_product)
# Create a named vector of coffee-tea palette
coffee_tea_palette <- c(coffee_colors, tea_colors)
names(coffee_tea_palette) <- unique_values[1:length(coffee_colors)] 
# Visualize the data against profit with coffee-tea palette 
boxplot(merged_coffee_data$Sales ~ merged_coffee_data$productType_product, 
        main = "log(Sales) by ProductType-Product", 
        ylab = "log(Sales)", 
        xlab = "ProductType-Product", 
        col = coffee_tea_palette,
        cex.axis = 0.7)  # Reduce font size of x-axis labels
#Anova test
anova_prodType_product <- aov(merged_coffee_data$Sales ~ merged_coffee_data$productType_product)
summary(anova_prodType_product)

#Conduct SMOTE
# Install and load the ROSE package
# Install and load the ROSE package if not already installed
if (!requireNamespace("ROSE", quietly = TRUE)) {
  install.packages("ROSE")
}
library(ROSE)

# Check the distribution of classes before SMOTE
table(merged_coffee_data$productType_product)

# Check the levels of the response variable
levels(merged_coffee_data$productType_product)

# Choose one level as the positive class (e.g., "Coff_Amare") and treat the rest as the negative class
# For example, if "Coff_Amare" is the minority class, then it will be the positive class, and the rest will be the negative class
merged_coffee_data$productType_product_binary <- ifelse(merged_coffee_data$productType_product == "Coff_Amare", "Yes", "No")

# Check the distribution of the binary response variable
table(merged_coffee_data$productType_product_binary)

# Perform SMOTE to balance the classes
balanced_data <- ROSE(productType_product_binary ~ ., data = merged_coffee_data, seed = 123)$data

# Check the distribution of classes after SMOTE
table(balanced_data$productType_product_binary)


# Perform SMOTE to balance the classes
balanced_data <- ROSE(productType_product ~ ., data = merged_coffee_data, seed = 123)$data

# Check the distribution of classes after SMOTE
table(balanced_data$productType_product)


#------------------------------------------------------------
# Convert Date column to Date format
merged_coffee_data$Date <- as.Date(as.character(merged_coffee_data$Date), format = '%m/%d/%Y')
# Create character column with a custom date format
merged_coffee_data$newDate <- strftime(merged_coffee_data$Date, '%d%m%Y')

# Fit a linear regression model with Sales as the dependent variable
salesdate_model <- lm(Sales ~ Date, data = merged_coffee_data)

# Plot the Sales against Date
plot(merged_coffee_data$Date, merged_coffee_data$Sales, 
     type = "l",  # 'l' for line plot
     xlab = "Date", ylab = "Sales",      # labels for x-axis and y-axis
     main = "log(Sales) vs Date")  

# Plot the linear regression line
lines(merged_coffee_data$Date, predict(salesdate_model), col = "red")

# Add confidence intervals for the regression line if needed
ci_salesdate <- predict(salesdate_model, interval = "confidence")
lines(merged_coffee_data$Date, ci_salesdate[, "lwr"], col = "blue", lty = 2)
lines(merged_coffee_data$Date, ci_salesdate[, "upr"], col = "blue", lty = 2)

# Summary of the model
summary(salesdate_model)

# Extract R-squared value
r_squared_profitdate <- summary(profitdate_model)$r.squared
cat("R-squared log(Sales) vs Date):", r_squared_profitdate, "\n")

# Extract adjusted R-squared value
adjusted_r_squared_profitdate <- summary(profitdate_model)$adj.r.squared
cat("Adjusted R-squared (log(Sales) vs Date):", adjusted_r_squared_profitdate, "\n")

# Extract residual standard error
residual_standard_error_profitdate <- summary(profitdate_model)$sigma
cat("Residual standard error (log(Sales) vs Date):", residual_standard_error_profitdate, "\n")

#------------------------------------------------------------

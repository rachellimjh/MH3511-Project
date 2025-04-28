# MH3511 Project (Data Analysis with Computer Project)

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=rstudio&logoColor=white)
![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)

We used R for data analysis and RStudio as the development environment.

**Team Members:**  
☕ Suki Ng  
🍵 Tay Shu Shuang  
☕ Rachel Lim (Lin Jiahuan)  
🍵 Chai Jie En  
☕ Rheanne Leong En Ting  

## Abstract  
The beverage landscape is divided between the two: coffee and tea, each with its own nuances and preferences. In this study, we delve into the intricate world of coffee and tea sales in the United States, leveraging a comprehensive dataset spanning the years 2012-2015. Our analysis aims to uncover key insights into consumer behaviour, market dynamics, and the factors influencing sales patterns in this industry.

### Introduction
In our project, a dataset from [Kaggle](https://www.kaggle.com/datasets/amruthayenikonda/coffee-chain-sales-dataset) containing the profit margins of coffee chains around the United States from 2012-15 with additional variables such as market size, type of coffee and product type. By utilising this dataset, we aim to answer the following questions regarding coffee and tea:

1. Which is the most popular type of coffee and tea respectively? 
2. Is the major market or small market more popular for coffee and tea sales respectively?
3. Does the sales of the coffee increase over the years? 
4. Which variables affect sales the most?
5. Does the major market hit their target sales better than the small market?

### Data Exploration and Cleaning
- Irrelevant columns are removed
- Duplicated rows are removed
- Empty rows are removed

For each variable, we 
(numerical variables)
1. Plot the histogram to ensure data is normally distributed
   - if data is skewed (left/right), apply log transformation
2. Remove any outliers using boxplot rule
   - outliers if: x<Q1−1.5(Q3−Q1) or x>Q3+1.5(Q3−Q1)

### Statistical Analysis
These are the statistical tests used:
- f-test
- variance test
- t-test
- ANOVA test
- multiple linear regression
- time series analysis

## Conclusion
We conclude that:
1. Regular espressos have higher sales on average relative to all the other types of coffee
2. The size of a market, major or minor indeed affects coffee and tea sales
3. Over time, the sales of coffee and tea increase but with greater volatility 
4. The variable that affects sales the most is margin
5. Major markets hit their target sales better than small markets

Looking ahead, further research could explore additional variables that may influence sales trends, such as demographic factors, consumer preferences, and the impact of marketing strategies.  
Additionally, expanding the scope of analysis to encompass broader geographical regions or a more extensive time frame could provide deeper insights into long-term market dynamics and trends.

## Full Report
For a comprehensive breakdown of our analysis and findings, you can view the full report [here](https://github.com/rachellimjh/MH3511-Project/blob/main/MH3511%20coffee%20tea%20or%20me_%20ME!%20.pdf).

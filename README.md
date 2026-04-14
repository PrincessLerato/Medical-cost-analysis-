Medical Insurance Cost Analysis (SQL Server)
Project Overview

This project analyzes medical insurance costs using SQL Server to identify the key factors that influence healthcare expenses. The goal is to understand how variables such as smoking status, age, BMI, gender, region, and number of children affect medical charges.

Objective
To explore and determine the main drivers of medical insurance costs and provide insights that can help understand risk factors affecting pricing.

Data Cleaning
The dataset was prepared and cleaned using SQL:

Created a staging table to preserve raw data
Standardized categorical variables (sex, smoker, region)
Checked for invalid values such as negative age or charges
Ensured consistency in data formatting

Analysis Performed
The following analyses were conducted:

Average medical charges by smoking status
Average charges by region
Gender impact on medical costs
Effect of number of children on charges
Combined analysis of smoker status and region
Age group analysis
BMI category analysis
Summary statistics (min, max, total charges)

Key Insights
Smoking is the strongest driver of high medical costs
Individuals aged 46 and above incur the highest expenses
Higher BMI is associated with increased medical charges
Region has a moderate impact on costs, with the Southeast showing higher values
Gender has minimal impact on medical costs
Number of children does not significantly affect charges

Conclusion
Medical insurance costs are primarily influenced by lifestyle and health-related factors such as smoking, age, and BMI. Demographic factors like gender and region have less impact in comparison.

Recommendations
Insurance providers should prioritize smoking status, age, and BMI when assessing risk and determining premiums, as these factors significantly affect medical expenses.

Tools Used
SQL Server
SQL (SELECT, GROUP BY, CASE, JOIN concepts not required but used for analysis)

Author
Princess Lerato Kgoedi
Aspiring Data Analyst | SQL | Data Cleaning | Data Insights

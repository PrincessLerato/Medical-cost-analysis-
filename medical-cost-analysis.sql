-- Project: Medical Insurance Cost Analysis 
-- Author: Princess Lerato Kgoedi
-- Objective: Analyze factors influencing medical costs 

----------------------------------------------------------------------------

-- Creating a new table in order to preserve the raw data

SELECT * 
INTO clean_insurancecosts
FROM Insurancecosts;

SELECT *
FROM clean_insurancecosts

-- Standardized categorical variables for consistency

SELECT
UPPER(LEFT(sex,1)) +
LOWER(SUBSTRING(sex,2,
LEN(sex))) AS Sex
FROM clean_insurancecosts

UPDATE clean_insurancecosts
SET sex = UPPER(LEFT(sex,1)) +
LOWER(SUBSTRING(sex,2,
LEN(sex)));

SELECT
UPPER(LEFT(smoker,1)) + 
LOWER(SUBSTRING(smoker,2,
LEN(smoker))) AS 
Smoker 
FROM clean_insurancecosts

UPDATE clean_insurancecosts
SET smoker = UPPER(LEFT(smoker,1)) + 
LOWER(SUBSTRING(smoker,2,
LEN(smoker)))

SELECT
UPPER(LEFT(region,1)) +
LOWER(SUBSTRING(region,2,
LEN(region))) AS Region
FROM clean_insurancecosts

UPDATE clean_insurancecosts
SET region = UPPER(LEFT(region,1)) +

LOWER(SUBSTRING(region,2,
LEN(region)))


SELECT *
FROM clean_insurancecosts
WHERE charges < 0 OR age < 0; 


-- Calculate average charges by smoker status

SELECT smoker,
AVG(charges) AS avg_charges
FROM clean_insurancecosts
GROUP BY smoker
ORDER BY avg_charges DESC;

-- INSIGHT: Smokers have significantly higher average medical costs compared to non-smokers, indicating that smoking is a major driver of healthcare expenses.


-- Calculate average charges by geography
  
SELECT region,
AVG(charges) AS avg_charges 
FROM clean_insurancecosts
GROUP BY region
ORDER BY avg_charges DESC;

-- INSIGHT: The Southeast region shows the highest average medical costs, although the difference between regions is relatively small;
-- Indicating that geography has moderate impact on costs 


-- Calculate average charges by sex

SELECT sex,
AVG(charges) AS avg_charges
FROM clean_insurancecosts
GROUP BY sex
ORDER BY avg_charges DESC;

-- INSIGHT: Males have slightly higher average medical costs; However, the difference is minimal, indicating that gender is not a strong cost driver


-- Calculate average charges by the number of children

SELECT children,
AVG(charges) AS avg_charges
FROM clean_insurancecosts
GROUP BY children
ORDER BY avg_charges DESC;

-- INSIGHT: The number of children does not significantly increase medical costs, suggesting that dependents are not a major factor in healthcare expenses.

-- Calculate average charges by geographical smokers

SELECT smoker, region,
AVG(charges) AS avg_charges
FROM clean_insurancecosts
GROUP BY smoker, region
ORDER BY smoker, avg_charges DESC;

-- INSIGHT: Smokers in the Southeast region incur the highest medical costs, highlighting how lifestyle and geographic factors can combine to increase medical expenses.


-- Calculating average charges by the age group

SELECT
CASE
WHEN age BETWEEN 18 AND 30 THEN '18-30'
WHEN age BETWEEN 31 AND 45 THEN '31-45'
ELSE '46+'
END AS age_group,
AVG(charges) AS avg_charges 
FROM clean_insurancecosts
GROUP BY
CASE
WHEN age BETWEEN 18 AND 30 THEN '18-30'
WHEN age BETWEEN 31 AND 45 THEN '31-45'
ELSE '46+'
END; 

-- INSIGHT: Individuals aged 46 and above have higher medical costs, confirming that healthcare expenses increase with age


-- Calculating average charges by the BMI

SELECT 
CASE 
WHEN bmi < 18.5 THEN 'Underweight'
WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
ELSE 'Obese'
END AS bmi_category,
AVG(charges) AS avg_charges 
FROM clean_insurancecosts
GROUP BY 
CASE 
WHEN bmi < 18.5 THEN 'Underweight'
WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
ELSE 'Obese'
END;

-- INSIGHT: Higher BMI categories, particularly overweight and obese individuals, are associated with increased medical costs, indicating a strong relationship
-- between weight and healthcare expenses


-- Calculating the SUM,MIN AND MAX charges 

SELECT SUM(charges) AS total_charges
FROM clean_insurancecosts;

SELECT MIN(charges) AS lowest_charge
FROM clean_insurancecosts;

SELECT MAX(charges) AS highest_charge
FROM clean_insurancecosts

----------------------------------------------------------------
-- FINAL INSIGHTS 
-- Smoking and age are the strongers drivers of medical costs 
-- BMI also shows a strong relationship with charges
-- Region and gender have minimal impact
-- -------------------------------------------------------------

-- Recommendation
-- Insurance providers should focus on smoking status, age,
-- when determining premiums. 
-- -------------------------------------------------------------

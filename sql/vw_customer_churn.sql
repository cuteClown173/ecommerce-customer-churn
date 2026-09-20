CREATE DATABASE ecommerce_db;
USE ecommerce_db;
SELECT COUNT(*) AS total_rows FROM customer_churn;
SELECT * FROM customer_churn LIMIT 10;

SELECT
COUNT(*) AS total_customers,
SUM(Churn) AS churned_customers,
ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM customer_churn;

SELECT
PreferedOrderCat,
COUNT(*) AS total_customers,
SUM(Churn) AS churned_customers,
ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY PreferedOrderCat
ORDER BY churn_rate_percentage DESC;

SELECT
MaritalStatus,
COUNT(*) AS total_customers,
SUM(Churn) AS churned_customers,
ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY MaritalStatus
ORDER BY churn_rate_percentage DESC;

SELECT
Complain,
COUNT(*) AS total_customers,
SUM(Churn) AS churned_customers,
ROUND((SUM(Churn) / COUNT(*)) * 100, 2) AS churn_rate_percentage
FROM customer_churn
GROUP BY Complain
ORDER BY churn_rate_percentage DESC;

SELECT 
Churn,
COUNT(*) AS total_customers,
ROUND(AVG(Tenure), 2) AS avg_tenure_months,
ROUND(AVG(WarehouseToHome), 2) AS avg_distance_to_warehouse
FROM customer_churn
GROUP BY Churn;

CREATE OR REPLACE VIEW vw_customer_churn AS 
SELECT
Tenure,
WarehouseToHome,
NumberOfDeviceRegistered,
PreferedOrderCat,
SatisfactionScore,
MaritalStatus,
NumberOfAddress,
Complain,
DaySinceLastOrder,
CashbackAmount,
Churn,
CASE
WHEN Churn = 1 THEN 'Churned'
ELSE 'Retained'
END AS Churn_Label,
CASE
WHEN Tenure <= 3 THEN '0-3 Months (High Risk)'
WHEN Tenure <= 12 THEN '4-12 Months (Medium Risk)'
ELSE '>12 Months (Low Risk)'
END AS Tenure_Group
FROM customer_churn;

SELECT * FROM vw_customer_churn;
SELECT * FROM vw_customer_churn;

DESCRIBE customer_churn;
SHOW COLUMNS FROM customer_churn;
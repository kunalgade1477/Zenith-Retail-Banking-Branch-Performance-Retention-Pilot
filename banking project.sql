use banking;

SELECT Branch_Key, COUNT(*)
FROM dim_branch
GROUP BY Branch_Key
HAVING COUNT(*) > 1;

SELECT Customer_Key, COUNT(*)
FROM dim_customer
GROUP BY Customer_Key
HAVING COUNT(*) > 1;

SELECT COUNT(*)
FROM fact_branch_performance f
LEFT JOIN dim_branch b
ON f.Branch_Key = b.Branch_Key
WHERE b.Branch_Key IS NULL;

SELECT COUNT(*)
FROM fact_branch_performance f
LEFT JOIN dim_customer c
ON f.Customer_Key = c.Customer_Key
WHERE c.Customer_Key IS NULL;


SELECT
    f.Performance_ID,
    b.Branch_Name,
    b.Region,
    c.Customer_Segment,
    e.Role,
    p.Product_Category,
    f.Transaction_Count,
    f.Transaction_Amount,
    f.Employee_Customer_Ratio,
    f.Customer_Satisfaction_Score,
    f.Revenue_Generated,
    f.Operating_Cost
FROM fact_branch_performance f
JOIN dim_branch b
    ON f.Branch_Key = b.Branch_Key
JOIN dim_customer c
    ON f.Customer_Key = c.Customer_Key
JOIN dim_employee e
    ON f.Employee_Key = e.Employee_Key
JOIN dim_product p
    ON f.Product_Key = p.Product_Key;
    
    
    
    CREATE VIEW master_branch_activity AS
SELECT
    f.Performance_ID,
    b.Branch_Name,
    b.Region,
    c.Customer_Segment,
    e.Role,
    p.Product_Category,
    f.Transaction_Count,
    f.Transaction_Amount,
    f.Employee_Customer_Ratio,
    f.Customer_Satisfaction_Score,
    f.Revenue_Generated,
    f.Operating_Cost
FROM fact_branch_performance f
JOIN dim_branch b
    ON f.Branch_Key = b.Branch_Key
JOIN dim_customer c
    ON f.Customer_Key = c.Customer_Key
JOIN dim_employee e
    ON f.Employee_Key = e.Employee_Key
JOIN dim_product p
    ON f.Product_Key = p.Product_Key;
    
    
    SELECT * 
FROM master_branch_activity
LIMIT 10;


SELECT
    Customer_Key,
    Months_Inactive,
    Transaction_Frequency,
    Churn_Flag
FROM fact_attrition
WHERE Churn_Flag = 1;


SELECT COUNT(*) AS Zero_Transaction_Customers
FROM fact_attrition
WHERE Months_Inactive >= 3;


CREATE VIEW at_risk_customers AS
SELECT
    Customer_Key,
    Months_Inactive,
    Transaction_Frequency,
    Avg_Balance,
    Complaints_Count
FROM fact_attrition
WHERE Months_Inactive >= 3
   OR Transaction_Frequency = 0;
   
   
   SELECT * FROM at_risk_customers;
   
   
WITH Branch_Deposits AS (
    SELECT
        b.Branch_ID,
        b.Branch_Name,
        SUM(f.Transaction_Amount) AS Total_Deposit_Volume
    FROM Fact_Branch_Performance f
    JOIN Dim_Branch b
        ON f.Branch_Key = b.Branch_Key
    GROUP BY
        b.Branch_ID,
        b.Branch_Name
)
SELECT
    Branch_ID,
    Branch_Name,
    Total_Deposit_Volume,
    RANK() OVER (
        ORDER BY Total_Deposit_Volume DESC
    ) AS Deposit_Rank
FROM Branch_Deposits;




WITH Branch_Performance AS (
    SELECT
        b.Branch_ID,
        b.Branch_Name,
        SUM(f.Transaction_Amount) AS Total_Deposit_Volume,
        AVG(f.Employee_Customer_Ratio) AS Efficiency_Score
    FROM Fact_Branch_Performance f
    JOIN Dim_Branch b
        ON f.Branch_Key = b.Branch_Key
    GROUP BY
        b.Branch_ID,
        b.Branch_Name
)
SELECT
    Branch_ID,
    Branch_Name,
    Total_Deposit_Volume,
    ROUND(Efficiency_Score,2) AS Efficiency_Score,
    RANK() OVER (
        ORDER BY Total_Deposit_Volume DESC
    ) AS Deposit_Rank,
    RANK() OVER (
        ORDER BY Efficiency_Score DESC
    ) AS Efficiency_Rank
FROM Branch_Performance;




CREATE OR REPLACE VIEW vw_branch_efficiency AS
SELECT
    b.Branch_ID,
    b.Branch_Name,
    COUNT(DISTINCT f.Customer_Key) AS Active_Customers,
    COUNT(DISTINCT f.Employee_Key) AS Staff_Count,
    ROUND(
        COUNT(DISTINCT f.Customer_Key) /
        NULLIF(COUNT(DISTINCT f.Employee_Key), 0),
        2
    ) AS Efficiency_Ratio
FROM Fact_Branch_Performance f
JOIN Dim_Branch b
    ON f.Branch_Key = b.Branch_Key
GROUP BY
    b.Branch_ID,
    b.Branch_Name;




CREATE OR REPLACE VIEW vw_branch_atv AS
SELECT
    b.Branch_ID,
    b.Branch_Name,
    ROUND(
        SUM(f.Transaction_Amount) /
        NULLIF(COUNT(*), 0),
        2
    ) AS Average_Transaction_Value
FROM Fact_Branch_Performance f
JOIN Dim_Branch b
    ON f.Branch_Key = b.Branch_Key
GROUP BY
    b.Branch_ID,
    b.Branch_Name;
    
    
    
    CREATE OR REPLACE VIEW vw_branch_atv AS
SELECT
    b.Branch_ID,
    b.Branch_Name,
    ROUND(AVG(f.Transaction_Amount),2) AS Average_Transaction_Value
FROM Fact_Branch_Performance f
JOIN Dim_Branch b
    ON f.Branch_Key = b.Branch_Key
GROUP BY
    b.Branch_ID,
    b.Branch_Name;
    
    
  SELECT *
FROM vw_branch_efficiency;


SELECT *
FROM vw_branch_atv;

__day__9th__work__

-- Check total records
SELECT COUNT(*) FROM Fact_Branch_Performance;

-- Check for NULL keys
SELECT *
FROM Fact_Branch_Performance
WHERE Branch_Key IS NULL
   OR Customer_Key IS NULL;

-- Validate aggregate totals
SELECT SUM(Transaction_Amount)
FROM Fact_Branch_Performance;

-- Detect duplicate performance records
SELECT Performance_ID, COUNT(*)
FROM Fact_Branch_Performance
GROUP BY Performance_ID
HAVING COUNT(*) > 1;



CREATE INDEX idx_branch_key
ON Fact_Branch_Performance (Branch_Key);

CREATE INDEX idx_customer_key
ON Fact_Branch_Performance (Customer_Key);

CREATE INDEX idx_date_key
ON Fact_Branch_Performance (Date_Key);

CREATE INDEX idx_product_key
ON Fact_Branch_Performance (Product_Key);

CREATE INDEX idx_employee_key
ON Fact_Branch_Performance (Employee_Key);
# Zenith-Retail-Banking-Branch-Performance-Retention-Pilot
Zenith Bank is seeing inconsistent performance across its regional branches. While deposit volumes are high in some areas, customer churn rates are rising. Regional managers need a way to identify which branches are meeting KPIs and which are leaking high-value customers before the end of the fiscal quarter.
# Banking Analytics SQL Project

## Project Overview

This project implements a Banking Analytics Data Warehouse using a Star Schema design. The solution supports branch performance analysis, customer behavior analysis, attrition monitoring, and transaction reporting through SQL-based analytics.

## Data Model

### Fact Tables

* Fact_Branch_Performance
* Fact_Attrition

### Dimension Tables

* Dim_Branch
* Dim_Customer
* Dim_Date
* Dim_Employee
* Dim_Geography
* Dim_Product

## SQL Query Logic

### Branch Deposit Analysis

* Aggregated transaction amounts at the branch level using `SUM()`.
* Calculated total deposit volume for performance comparison.
* Ranked branches using SQL window functions (`RANK()` and `DENSE_RANK()`).

### Branch Efficiency Analysis

* Measured branch efficiency using Customer-to-Staff ratios.
* Compared branch operational performance across locations.
* Created reusable SQL views for reporting.

### Customer Attrition Analysis

* Identified inactive and at-risk customers.
* Analyzed customer churn trends using transaction history.
* Built analytical views for retention monitoring.

### Average Transaction Value (ATV)

* Calculated branch-level Average Transaction Value using aggregate functions.
* Compared transaction behavior across branches and products.

### Window Functions

Implemented:

* RANK()
* DENSE_RANK()
* ROW_NUMBER()

Used for:

* Branch performance ranking
* Deposit volume ranking
* Customer segmentation

### Data Validation Checks

* Verified record counts after loading.
* Checked for NULL foreign keys.
* Validated aggregate totals.
* Identified duplicate records.

### Performance Optimization

* Added indexes on frequently filtered columns:

  * Branch_Key
  * Customer_Key
  * Date_Key
  * Product_Key
  * Employee_Key
* Optimized joins between fact and dimension tables.


## Key Business Insights

* Identified top-performing branches by deposit volume.
* Measured branch efficiency using customer-to-staff ratios.
* Detected customer attrition patterns.
* Generated datasets for Python and Tableau dashboards.

* ## Exploratory Data Analysis (EDA) Findings

### Data Quality Assessment

* Loaded banking dimension and fact tables into Pandas DataFrames.
* Validated schema integrity and checked for missing values and duplicate records.
* Performed data cleaning and preprocessing before analysis.

### Customer Attrition Analysis

* Correlation analysis identified Months_Inactive as the strongest predictor of customer churn.
* Complaints_Count showed a moderate positive relationship with attrition.
* Average Balance and Transaction Frequency exhibited weak relationships with churn behavior.

### Customer Segmentation

* Implemented rule-based segmentation using Average Balance.
* Classified customers into Gold, Silver, and Bronze tiers.
* Analyzed segment distribution for customer profiling.

### Branch and Employee Performance

* Calculated Employee Productivity Scores using transaction volume, customer satisfaction, and service efficiency metrics.
* Evaluated operational performance across branches and employees.

### Outlier Detection

* Applied the Interquartile Range (IQR) method to identify unusual transaction amounts.
* Visualized transaction distributions using boxplots.
* Flagged extreme values for further business review.

### Deliverables

* Exported curated datasets for Power BI dashboard development.
* Created reusable Python scripts for reproducible analytics workflows.
* Generated visualizations to support business decision-making and performance monitoring.


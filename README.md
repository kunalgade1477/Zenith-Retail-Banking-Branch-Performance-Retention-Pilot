# 🏦 Zenith Retail Banking Branch Performance & Retention Pilot

A comprehensive Banking Analytics project designed to evaluate branch-level performance, identify customer attrition risks, and optimize resource allocation through SQL, Python, Machine Learning, and Power BI.

---

## 📌 Project Overview

Zenith Bank is experiencing inconsistent branch performance across regions. While some branches generate strong revenue, others face increasing customer attrition and declining operational efficiency.

This project analyzes branch performance by examining:

* Employee-to-Customer Ratios
* Transaction Frequency
* Customer Attrition Rates
* Revenue Generation
* Customer Satisfaction
* Employee Productivity

The solution helps management identify underperforming branches, reduce customer churn, and improve resource allocation.

---

## 🎯 Business Problem

Evaluate branch-level performance by quantifying the correlation between employee-to-customer ratios, transaction frequency, and customer attrition rates to optimize resource allocation.

### Key Challenges

* Rising customer attrition in specific branches
* Uneven branch performance across regions
* Resource allocation inefficiencies
* Reduced customer satisfaction impacting retention
* Lack of visibility into operational KPIs

---

## 📊 Project Objectives

* Analyze branch performance across multiple KPIs
* Identify factors contributing to customer attrition
* Evaluate employee efficiency and productivity
* Measure customer engagement through transaction activity
* Develop interactive dashboards for business stakeholders
* Build a machine learning model to predict customer attrition

---

## 🗂️ Dataset Overview

### Dimension Tables

| Table         | Description                        |
| ------------- | ---------------------------------- |
| dim_branch    | Branch information                 |
| dim_customer  | Customer demographics and profiles |
| dim_date      | Date hierarchy                     |
| dim_employee  | Employee details                   |
| dim_geography | Geographic information             |
| dim_product   | Product details                    |

### Fact Tables

| Table                   | Description             |
| ----------------------- | ----------------------- |
| fact_attrition          | Customer churn metrics  |
| fact_branch_performance | Branch performance KPIs |

---

## 🛠️ Technology Stack

### Data Processing

* Python
* Pandas
* NumPy

### Database

* SQL
* MySQL

### Visualization

* Power BI

### Machine Learning

* Scikit-Learn
* Logistic Regression

### Development Environment

* Jupyter Notebook
* VS Code

---

## 📈 Power BI Dashboard

### Page 1 – Executive Summary

KPIs:

* Total Revenue
* Total Transactions
* Customer Attrition Rate
* Average Satisfaction Score

Visuals:

* Revenue Trend
* Transaction Trend
* KPI Cards
* Branch Performance Overview

---

### Page 2 – Branch Performance Analysis

Visuals:

* Revenue by Branch
* Transaction Amount by Branch
* Operating Cost by Branch
* Branch Ranking Table

Insights:

* Top Performing Branches
* Low Performing Branches
* Revenue Distribution

---

### Page 3 – Customer Attrition Analysis

Visuals:

* Attrition by Branch
* Attrition by Customer Segment
* Attrition by Region
* Customer Satisfaction vs Attrition

Insights:

* High-Risk Customer Segments
* Regions with Highest Churn
* Retention Opportunities

---

### Page 4 – Employee Efficiency Dashboard

Visuals:

* Employee-to-Customer Ratio by Branch
* Employee Productivity Score
* Average Service Time
* Revenue vs Attrition Scatter Plot

Insights:

* Resource Allocation Efficiency
* Impact of Staffing on Customer Retention
* Employee Performance Trends

---

### Page 5 – Transaction & Customer Insights

Visuals:

* Transactions by Product Category
* Revenue by Customer Segment
* Revenue by Region
* Monthly Transaction Trends

Insights:

* Customer Behavior Patterns
* Product Performance Analysis
* Revenue Drivers

---

## 🤖 Machine Learning Model

### Objective

Predict customer attrition using historical customer and branch performance data.

### Target Variable

```text
Customer_Attrition_Flag
```

### Features

* Transaction_Count
* Transaction_Amount
* Employee_Customer_Ratio
* Customer_Satisfaction_Score
* Revenue_Generated
* Operating_Cost
* Employee_Productivity_Score
* Avg_Service_Time
* Customer_Segment
* Product_Category
* Region

### Models Implemented

#### Logistic Regression

* Binary Classification Model
* Customer Churn Prediction
* Feature Importance Analysis

#### Random Forest Classifier

* Non-linear Relationship Detection
* Feature Importance Ranking
* Improved Prediction Accuracy

### Evaluation Metrics

* Accuracy
* Precision
* Recall
* F1 Score
* ROC-AUC Score
* Confusion Matrix

---

## 📊 Key Performance Indicators (KPIs)

* Customer Attrition Rate
* Revenue Generated
* Employee Productivity Score
* Customer Satisfaction Score
* Transaction Volume
* Revenue per Customer
* Transactions per Customer
* Employee-to-Customer Ratio

---

## 🔍 Business Insights Generated

* Identified branches with high customer attrition.
* Measured the impact of staffing levels on customer retention.
* Evaluated branch operational efficiency.
* Analyzed customer transaction behavior.
* Highlighted opportunities for targeted retention strategies.
* Improved visibility into branch-level performance metrics.

---

## 🚀 Future Enhancements

* Real-time dashboard integration
* Automated churn prediction pipeline
* Customer Lifetime Value (CLV) analysis
* Predictive branch performance forecasting
* Advanced customer segmentation

---

## 👨‍💻 Author

**Kunal Gade**

Data Analyst | SQL | Python | Power BI | Machine Learning

GitHub Repository:
https://github.com/kunalgade1477/Zenith-Retail-Banking-Branch-Performance-Retention-Pilot

---

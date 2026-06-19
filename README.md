# ecommerce-product-analytics-dashboard
End-to-end Product Analytics project using PostgreSQL, SQL, and Tableau.

# 📊 E-commerce Product Analytics Dashboard

An end-to-end **Product Analytics** project built using **PostgreSQL**, **SQL**, and **Tableau** to analyze over **4.1 million e-commerce events** and transform raw event data into actionable business insights through an executive dashboard.

---

## 🚀 Project Overview

This project simulates a real-world product analytics workflow, covering everything from database creation and SQL analysis to dashboard development.

The objective was to answer key business questions such as:

* How much revenue did the business generate?
* How many users and sessions were recorded?
* What is the conversion rate from view to purchase?
* Which brands contribute the most revenue?
* How does revenue change over time?
* Where are users dropping off in the purchase funnel?

---

## 📂 Dataset

**Source:** Kaggle E-commerce Behavior Dataset (October 2019)

### Dataset Statistics

| Metric         |         Value |
| -------------- | ------------: |
| Total Events   | **4,102,283** |
| Unique Users   |   **399,664** |
| Total Sessions |   **873,960** |
| Time Period    |  October 2019 |

---

## 🛠 Tech Stack

* PostgreSQL
* SQL
* Tableau Desktop
* pgAdmin 4

---

## 📈 Executive Dashboard

The dashboard provides a high-level overview of business performance through interactive visualizations and KPIs.

### Dashboard Includes

* Revenue KPI
* Total Users
* Total Sessions
* Average Order Value (AOV)
* Purchase Funnel Analysis
* Daily Revenue Trend
* Revenue by Brand

> **Dashboard Preview**

![Executive Dashboard](images/dashboard.png)

---

## 📊 Key Business Metrics

| KPI                 |       Value |
| ------------------- | ----------: |
| Revenue             |  **$1.21M** |
| Users               | **399,664** |
| Sessions            | **873,960** |
| Average Order Value |   **$4.93** |

---

## 🔍 SQL Analysis

Business metrics were calculated using SQL queries executed in PostgreSQL.

The project includes queries for:

* Revenue calculation
* Total users
* Total sessions
* Conversion rate
* Average Order Value
* Funnel analysis
* Revenue by brand
* Revenue by category
* Top-performing brands
* Customer lifetime value
* Brand conversion analysis

Example:

```sql
SELECT
    brand,
    ROUND(SUM(price),2) AS revenue
FROM ecommerce_events
WHERE event_type = 'purchase'
GROUP BY brand
ORDER BY revenue DESC
LIMIT 10;
```

---

## 📌 Key Insights

* Generated **$1.21M** in revenue during October 2019.
* Identified **399,664** unique users across **873,960** sessions.
* Average Order Value (AOV) was **$4.93**.
* The purchase funnel revealed a significant drop-off between product views and completed purchases.
* Revenue remained relatively stable throughout the month.
* A small number of brands contributed a disproportionate share of total revenue.

---

## 📁 Repository Structure

```
ecommerce-product-analytics-dashboard
│
├── README.md
├── sql/
│   ├── analysis_queries.sql
│   └── database_schema.sql
│
├── dashboard/
│   ├── ecommerce_dashboard.twb
│   └── dashboard.png
│
├── images/
│   ├── dashboard.png
│   └── sql_analysis.png
│
└── dataset/
    └── dataset_source.txt
```

---

## 📚 Skills Demonstrated

* SQL Querying
* Data Cleaning
* Data Aggregation
* KPI Development
* Product Analytics
* Funnel Analysis
* Business Intelligence
* Data Visualization
* Dashboard Design
* PostgreSQL
* Tableau

---

## 🎯 Business Value

This project demonstrates how raw event-level data can be transformed into meaningful business intelligence that supports product and revenue decisions.

By combining SQL for analysis with Tableau for visualization, the dashboard enables stakeholders to monitor key performance indicators, identify trends, and quickly explore areas requiring attention.

---

## ⚙️ How to Run This Project

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/ecommerce-product-analytics-dashboard.git
```

---

### 2. Install Requirements

Make sure you have the following installed:

* PostgreSQL 18 (or later)
* pgAdmin 4
* Tableau Desktop

---

### 3. Create the Database

Create a new PostgreSQL database named:

```sql
ecom_analytics
```

Run the schema file located in:

```
sql/database_schema.sql
```

This will create the `ecommerce_events` table.

---

### 4. Import the Dataset

Import the October 2019 CSV dataset into the `ecommerce_events` table using pgAdmin's **Import/Export Data** feature.

Dataset source:

```
dataset/dataset_source.txt
```

---

### 5. Run SQL Analysis

Execute the queries located in:

```
sql/analysis_queries.sql
```

These queries calculate:

* Revenue
* Users
* Sessions
* Average Order Value (AOV)
* Conversion Rate
* Funnel Analysis
* Revenue by Brand
* Revenue by Category
* Customer Lifetime Value
* Brand Conversion Rate

---

### 6. Open the Tableau Dashboard

Open the Tableau workbook located in:

```
dashboard/ecommerce_dashboard.twb
```

Reconnect the workbook to your local PostgreSQL database if prompted.

Connection settings:

* **Server:** localhost
* **Database:** ecom_analytics
* **Table:** ecommerce_events

---

### 7. Explore the Dashboard

The executive dashboard includes:

* 📈 Revenue KPI
* 👥 Total Users
* 🔄 Total Sessions
* 🛒 Average Order Value (AOV)
* 📉 Purchase Funnel Analysis
* 📊 Daily Revenue Trend
* 🏷️ Revenue by Brand

---

## 📂 Repository Structure

```
ecommerce-product-analytics-dashboard/
│
├── README.md
├── sql/
│   ├── database_schema.sql
│   └── analysis_queries.sql
│
├── dashboard/
│   ├── ecommerce_dashboard.twb
│   └── dashboard.png
│
├── images/
│   ├── dashboard.png
│   └── sql_analysis.png
│
└── dataset/
    └── dataset_source.txt
```




---

## 📬 Contact

**Saad Tahir**

* LinkedIn: www.linkedin.com/in/saad-tahir-798324326
* Github: saad97tahir
* Gmail: saad97tahir@gmail.com

Feel free to connect or reach out with feedback or opportunities.

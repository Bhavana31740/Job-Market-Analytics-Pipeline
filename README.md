# Job Market Analytics ETL Pipeline

## 📌 Project Overview

The Job Market Analytics ETL Pipeline is a data engineering and analytics project that processes real-world job market data using Python, Pandas, PostgreSQL, and SQL.

The pipeline automatically extracts job data from an Excel dataset, cleans and transforms the data, loads it into PostgreSQL, and performs SQL-based analysis to identify job market trends.

## 🎯 Project Objectives

- Analyze job demand across different roles and locations
- Identify the most demanded job titles
- Analyze salary trends
- Identify companies hiring the most
- Analyze experience requirements
- Identify the most demanded technical skills
- Perform data quality validation

## 🔄 ETL Pipeline

Raw Excel Dataset → Extract → Transform → cleaned_jobs.csv → Load → PostgreSQL → SQL Analysis → Job Market Insights

## 🛠️ Technologies Used

- Python
- Pandas
- PostgreSQL
- SQL
- SQLAlchemy
- psycopg2
- Excel
- Git & GitHub

## 📂 Project Structure

```text
Job-Market-Analytics-Pipeline/
│
├── data/
│   ├── raw/
│   │   └── indian-job-market-dataset-2025.xlsx
│   └── processed/
│       └── cleaned_jobs.csv
│
├── src/
│   ├── extract.py
│   ├── transform.py
│   └── load.py
│
├── sql/
│   └── analysis.sql
│
├── main.py
├── requirements.txt
└── README.md
```

## 🧹 Data Transformation

The transformation process includes:

- Removing duplicate rows
- Cleaning column names
- Handling missing values
- Cleaning text fields
- Converting salary and experience fields to numeric values
- Creating `skillCount`
- Creating `salaryRange`
- Creating `averageSalary`
- Creating `experienceRange`

The original dataset contained **97,029 rows**.

After removing duplicate rows, **96,782 rows** were processed and loaded into PostgreSQL.

## 🗄️ Database

PostgreSQL is used as the target database.

The cleaned job data is loaded into a table named:

```text
jobs
```

The database contains job information such as:

- Job title
- Company
- Location
- Salary
- Experience
- Skills
- Job description
- Job posting information

## 📊 SQL Analysis

The project performs SQL analysis to answer questions such as:

1. What are the top 20 most demanded job titles?
2. Which locations have the highest number of job openings?
3. What is the average salary by job title?
4. Which companies are hiring the most?
5. Which job titles have the largest salary ranges?
6. What experience levels are most commonly required?
7. Which jobs require the most skills?
8. What are the most demanded technical skills?
9. What is the data quality of the dataset?
10. Are there duplicate job IDs?
11. What are the average salaries by location?
12. What is the job demand by currency?
13. How frequently are jobs being posted?

## 🔍 Data Validation

The project includes data quality checks for:

- Total number of records
- Unique job IDs
- Missing job titles
- Missing locations
- Missing company names
- Jobs without salary information
- Jobs without experience information

## ⚡ One-Click Pipeline Execution

The complete ETL pipeline can be executed using:

```bash
python main.py
```

This automatically runs:

```text
Extract → Transform → Load
```

The pipeline successfully processed and loaded **96,782 records** into PostgreSQL.

## 📈 Key Skills Demonstrated

This project demonstrates practical experience with:

- ETL pipeline development
- Data cleaning
- Data transformation
- Feature engineering
- PostgreSQL database loading
- SQL aggregation
- GROUP BY and HAVING
- CASE statements
- Data validation
- Python automation
- Business-oriented data analysis

## 👩‍💻 Author

**Bhavana**

Aspiring Data Analyst

**Skills:** Python | SQL | PostgreSQL | Pandas | Power BI

# Job Market Analytics ETL Pipeline

## 📌 Project Overview

The Job Market Analytics ETL Pipeline is a data engineering and analytics project that processes job-market data using Python, Pandas, PostgreSQL, and SQL.

The pipeline extracts raw job data, cleans and transforms it, loads the processed data into PostgreSQL, and performs SQL-based analysis to identify job-market trends and insights.

## 🛠️ Technologies Used

- Python
- Pandas
- PostgreSQL
- SQL
- Excel
- Git & GitHub

## 🔄 ETL Workflow

Raw Job Data
      ↓
Extract using Python
      ↓
Clean & Transform using Pandas
      ↓
Load into PostgreSQL
      ↓
SQL Analysis
      ↓
Job Market Insights

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

'jobs'

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

The project uses PostgreSQL SQL queries to analyze:

1. Top demanded job titles
2. Top hiring locations
3. Average salary by job title
4. Companies with the highest number of job postings
5. Salary ranges
6. Experience requirements
7. Jobs by experience level
8. Most frequently required technical skills
9. Average salary by location
10. Job posting recency
11. Job demand by currency
12. Data quality
13. Duplicate job IDs

## ✅ Data Validation

The pipeline performs data-quality checks to validate the processed job data.

Validation checks include:

- Row count validation
- Missing-value checks
- Duplicate checks
- Unique job ID checks
- Salary value validation
- Experience value validation

## 📈 Key Analysis Results

The SQL analysis provides insights into:

- Most demanded job roles
- Locations with high job demand
- Salary differences between job roles
- Companies with frequent job postings
- Commonly required technical skills
- Experience requirements across job postings
- Salary patterns across locations
- Job posting trends

## 📂 Project Structure

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


## 👩‍💻 Author

**Bhavana**

Aspiring Data Analyst

**Skills:** Python | SQL | PostgreSQL | Pandas | Power BI

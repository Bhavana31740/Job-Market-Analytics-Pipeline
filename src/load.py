import pandas as pd
from sqlalchemy import create_engine

# Read cleaned CSV
df = pd.read_csv("data/processed/cleaned_jobs.csv")

print("CSV loaded successfully!")
print("Rows:", len(df))

# Connect to PostgreSQL
engine = create_engine(
    "postgresql+psycopg2://postgres:2005@localhost:5432/job_market_db"
)

# Load data into PostgreSQL
# replace prevents duplicate data when the pipeline is run again
df.to_sql("jobs", engine, if_exists="replace", index=False)

print("Data loaded successfully into PostgreSQL!")
print("Total rows loaded:", len(df))
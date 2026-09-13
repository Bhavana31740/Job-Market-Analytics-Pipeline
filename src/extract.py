import pandas as pd

file_path = "data/raw/indian-job-market-dataset-2025.xlsx"

df = pd.read_excel(file_path)

print("DATA LOADED SUCCESSFULLY")

print("\n--- DATASET SHAPE ---")
print(df.shape)

print("\n--- COLUMN NAMES ---")
print(df.columns.tolist())

print("\n--- DATA TYPES ---")
print(df.dtypes)

print("\n--- MISSING VALUES ---")
print(df.isnull().sum())

print("\n--- DUPLICATE ROWS ---")
print(df.duplicated().sum())

print("\n--- FIRST 5 ROWS ---")
print(df.head())

print("\n--- BASIC STATISTICS ---")
print(df.describe(include="all"))
import pandas as pd

# Load raw data
file_path = "data/raw/indian-job-market-dataset-2025.xlsx"
df = pd.read_excel(file_path)

print("Original rows:", len(df))

# 1. Remove duplicate rows
df = df.drop_duplicates()

print("Rows after removing duplicates:", len(df))

# 2. Clean column names
df.columns = df.columns.str.strip()

# 3. Clean text columns
text_columns = [
    "title",
    "currency",
    "jobUploaded",
    "companyName",
    "tagsAndSkills",
    "experience",
    "salary",
    "location",
    "jobDescription"
]

for col in text_columns:
    if col in df.columns:
        df[col] = df[col].fillna("Unknown")
        df[col] = df[col].astype(str).str.strip()

# 4. Convert salary columns to numeric
numeric_columns = [
    "minimumSalary",
    "maximumSalary",
    "minimumExperience",
    "maximumExperience"
]

for col in numeric_columns:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors="coerce")

# 5. Fill missing numeric values
for col in numeric_columns:
    if col in df.columns:
        df[col] = df[col].fillna(0)
# 6. Create useful analytical columns

# Skill count
df["skillCount"] = (
    df["tagsAndSkills"]
    .fillna("")
    .apply(lambda x: len([s for s in str(x).split(",") if s.strip()]))
)

# Salary range
df["salaryRange"] = (
    df["maximumSalary"] - df["minimumSalary"]
)

# Average salary
df["averageSalary"] = (
    df["minimumSalary"] + df["maximumSalary"]
) / 2

# Experience range
df["experienceRange"] = (
    df["maximumExperience"] - df["minimumExperience"]
)

print("\nNew analytical columns created:")
print("skillCount")
print("salaryRange")
print("averageSalary")
print("experienceRange")

# 6. Save cleaned data
output_file = "data/processed/cleaned_jobs.csv"

df.to_csv(output_file, index=False)

print("\nCleaning completed!")
print("Final rows:", len(df))
print("Final columns:", len(df.columns))
print("Cleaned file saved to:", output_file)
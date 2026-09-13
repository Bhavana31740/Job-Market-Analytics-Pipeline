import subprocess
import sys
import time

print("=" * 50)
print("       JOB MARKET ETL PIPELINE")
print("=" * 50)

start_time = time.time()

try:

    # Step 1: Extract
    print("\n[1/3] Extracting data...")
    subprocess.run(
        [sys.executable, "src/extract.py"],
        check=True
    )
    print("Extraction completed successfully!")

    # Step 2: Transform
    print("\n[2/3] Cleaning and transforming data...")
    subprocess.run(
        [sys.executable, "src/transform.py"],
        check=True
    )
    print("Transformation completed successfully!")

    # Step 3: Load
    print("\n[3/3] Loading data into PostgreSQL...")
    subprocess.run(
        [sys.executable, "src/load.py"],
        check=True
    )
    print("Loading completed successfully!")

    # Pipeline completed
    end_time = time.time()
    execution_time = end_time - start_time

    print("\n" + "=" * 50)
    print("       ETL PIPELINE COMPLETED!")
    print("=" * 50)
    print(f"Execution time: {execution_time:.2f} seconds")

except subprocess.CalledProcessError as error:

    print("\n" + "=" * 50)
    print("       ETL PIPELINE FAILED")
    print("=" * 50)
    print("Error occurred while running one of the pipeline steps.")
    print("Please check the error message above.")
"""Download IBM HR Attrition dataset from Kaggle and load into PostgreSQL."""
import os, subprocess
import pandas as pd
from sqlalchemy import create_engine

DB_URL = os.getenv("DATABASE_URL", "postgresql://hr_user:hr_pass@localhost:5433/hr_db")

def download():
    subprocess.run(["kaggle", "datasets", "download", "-d",
                    "pavansubhasht/ibm-hr-analytics-attrition-dataset",
                    "--unzip", "-p", "/tmp/hr"], check=True)

def load():
    engine = create_engine(DB_URL)
    df = pd.read_csv("/tmp/hr/WA_Fn-UseC_-HR-Employee-Attrition.csv")
    df.columns = [c.strip() for c in df.columns]
    df.to_sql("employees", engine, if_exists="replace", index=False)
    print(f"Loaded {len(df):,} employees")

if __name__ == "__main__":
    download()
    load()

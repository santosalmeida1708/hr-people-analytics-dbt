# HR People Analytics — dbt Project

Analytics Engineering project using the **IBM HR Analytics Employee Attrition** dataset.

## Key Models

| Model | Description |
|---|---|
| `stg_employees` | Cleaned employees with tenure_band and age_band |
| `fct_headcount` | Headcount KPIs by department, role, gender |
| `attrition_analysis` | Attrition rate by department, role, tenure, age |
| `compensation_analysis` | Salary analysis with median (percentile_cont) |

## Stack
- dbt-core 1.7 + PostgreSQL 15 (port 5433)
- Docker Compose

## How to Run
```bash
docker compose up -d
python scripts/load_hr_data.py
dbt deps && dbt run && dbt test
```

{{ config(materialized='table') }}
select
    department,
    job_role,
    gender,
    count(employee_id)                                        as headcount,
    avg(annual_income)                                        as avg_annual_income,
    percentile_cont(0.5) within group (order by annual_income) as median_income,
    min(annual_income)                                        as min_income,
    max(annual_income)                                        as max_income
from {{ ref('int_employees_enriched') }}
group by 1, 2, 3

{{ config(materialized='table') }}
select
    department,
    job_role,
    gender,
    tenure_band,
    age_band,
    engagement_status,
    performance_tier,
    count(employee_id)                                       as headcount,
    avg(annual_income)                                       as avg_annual_income,
    avg(years_at_company)                                    as avg_tenure,
    sum(case when attrition = 'Yes' then 1 else 0 end)       as attrition_count,
    round(100.0 * sum(case when attrition = 'Yes' then 1 else 0 end) / count(employee_id), 2) as attrition_rate
from {{ ref('int_employees_enriched') }}
group by 1,2,3,4,5,6,7

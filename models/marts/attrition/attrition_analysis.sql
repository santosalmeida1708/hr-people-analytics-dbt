{{ config(materialized='table') }}
select 'department'  as dimension, department  as segment,
    count(*) as total, sum(case when attrition='Yes' then 1 else 0 end) as churned,
    round(100.0 * sum(case when attrition='Yes' then 1 else 0 end)/count(*),2) as attrition_rate
from {{ ref('int_employees_enriched') }}
group by 2
union all
select 'job_role', job_role,
    count(*), sum(case when attrition='Yes' then 1 else 0 end),
    round(100.0 * sum(case when attrition='Yes' then 1 else 0 end)/count(*),2)
from {{ ref('int_employees_enriched') }}
group by 2
union all
select 'tenure_band', tenure_band,
    count(*), sum(case when attrition='Yes' then 1 else 0 end),
    round(100.0 * sum(case when attrition='Yes' then 1 else 0 end)/count(*),2)
from {{ ref('int_employees_enriched') }}
group by 2
union all
select 'age_band', age_band,
    count(*), sum(case when attrition='Yes' then 1 else 0 end),
    round(100.0 * sum(case when attrition='Yes' then 1 else 0 end)/count(*),2)
from {{ ref('int_employees_enriched') }}
group by 2

{{ config(materialized='ephemeral') }}
select *,
    monthly_income * 12                       as annual_income,
    case
        when job_satisfaction >= 3 and work_life_balance >= 3 then 'Engaged'
        when job_satisfaction >= 2 or work_life_balance >= 2  then 'Neutral'
        else 'Disengaged'
    end as engagement_status,
    case
        when performance_rating = 4 then 'High Performer'
        when performance_rating = 3 then 'Solid Performer'
        else 'Needs Improvement'
    end as performance_tier
from {{ ref('stg_employees') }}

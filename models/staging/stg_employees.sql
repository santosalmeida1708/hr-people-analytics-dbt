{{ config(materialized='view') }}
select
    cast("EmployeeNumber" as int)           as employee_id,
    "Age"                                   as age,
    "Attrition"                             as attrition,
    "BusinessTravel"                        as business_travel,
    "Department"                            as department,
    "DistanceFromHome"                      as distance_from_home,
    "Education"                             as education_level,
    "EducationField"                        as education_field,
    "Gender"                                as gender,
    "JobRole"                               as job_role,
    "JobLevel"                              as job_level,
    "JobSatisfaction"                       as job_satisfaction,
    "MaritalStatus"                         as marital_status,
    "MonthlyIncome"                         as monthly_income,
    "NumCompaniesWorked"                    as companies_worked,
    "OverTime"                              as overtime,
    "PercentSalaryHike"                     as salary_hike_pct,
    "PerformanceRating"                     as performance_rating,
    "TotalWorkingYears"                     as total_working_years,
    "TrainingTimesLastYear"                 as trainings_last_year,
    "WorkLifeBalance"                       as work_life_balance,
    "YearsAtCompany"                        as years_at_company,
    "YearsInCurrentRole"                    as years_in_role,
    "YearsSinceLastPromotion"               as years_since_promotion,
    "YearsWithCurrManager"                  as years_with_manager,
    case
        when "YearsAtCompany" <= 1  then '0-1 years'
        when "YearsAtCompany" <= 3  then '2-3 years'
        when "YearsAtCompany" <= 7  then '4-7 years'
        when "YearsAtCompany" <= 15 then '8-15 years'
        else '15+ years'
    end as tenure_band,
    case
        when "Age" < 30 then 'Under 30'
        when "Age" < 40 then '30-39'
        when "Age" < 50 then '40-49'
        else '50+'
    end as age_band
from {{ source('hr_raw', 'employees') }}

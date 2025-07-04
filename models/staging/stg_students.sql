with raw as (
select * from {{source("Snowflake_Source","students")}}
),
final as (
    select *,
    DATEDIFF('year', Date_of_Birth, CURRENT_DATE()) as age_of_student, -- age of students
    YEAR(Enrollment_Date) as enrollment_year, -- enrollments
    First_Name || ' ' || Last_Name as full_name, -- full names 
    case when DATEDIFF('year', Date_of_Birth, CURRENT_DATE()) >= 18 THEN 'Yes' ELSE 'No' END as is_adult, -- is student adult?
    DATEDIFF('day', Enrollment_Date, CURRENT_DATE()) as days_since_enrollment -- days since enrollment

    from raw
)
select * from final 
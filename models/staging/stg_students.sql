with raw as (
select * from {{source("Snowflake_Source","students")}}
),
final as (
    select *,
    DATEDIFF('year', Date_of_Birth, CURRENT_DATE()) as age_of_student, -- age of students
    YEAR(Enrollment_Date) as enrollment_year, -- enrollments
    First_Name || ' ' || Last_Name as full_name -- full names 
    from raw
)
select * from final
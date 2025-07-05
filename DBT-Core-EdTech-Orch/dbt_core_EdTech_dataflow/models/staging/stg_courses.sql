with raw as (
    select * from {{ source("Snowflake_Source", "courses") }}
),
final as (
    select
        *,
        CASE 
            WHEN "CREDITS" = 3 THEN 'Beginner'
            WHEN "CREDITS" = 4 THEN 'Intermediate'
            ELSE 'Advanced'
        END as Course_Level, -- level of course

        CASE
            WHEN CURRENT_DATE() BETWEEN "START_DATE" AND "END_DATE" THEN 'Yes'
            ELSE 'No'
        END as is_course_active, -- is course active?

        CASE
            WHEN CURRENT_DATE() < "START_DATE" THEN DATEDIFF('day', CURRENT_DATE(), "START_DATE")
            ELSE 0
        END as days_passed_until_start, -- days until course starts

        CASE
            WHEN CURRENT_DATE() > "END_DATE" THEN 'Ended'
            WHEN CURRENT_DATE() BETWEEN "START_DATE" AND "END_DATE" THEN 'Ongoing'
            ELSE 'Yet to Start'
        END as status_of_course -- status of course
    from raw
)
select * from final

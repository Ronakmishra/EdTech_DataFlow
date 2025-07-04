with raw as (
    select * from {{source("Snowflake_Source","enrollments")}}
),
final as (

)

select * from final
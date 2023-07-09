
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

with source_data as (

    SELECT * 
    FROM `dbt-tests-392306.google_trends.international_top_terms` 
    WHERE 
    country_name = 'Brazil'
    AND refresh_date >= "2023-07-08"
    AND week >= '2023-07-01'
    AND region_name = 'State of São Paulo'
    ORDER BY rank ASC
    LIMIT 10

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null

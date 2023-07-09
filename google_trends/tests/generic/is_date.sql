{% test is_date(model, column_name) %}

with validation as (

    select
        {{ column_name }} as date_field

    from {{ model }}

),

validation_errors as (

    select
        date_field

    from validation
    -- if this is true, then date_field is date
    where date(date_field) != date_field

)

select *
from validation_errors

{% endtest %}
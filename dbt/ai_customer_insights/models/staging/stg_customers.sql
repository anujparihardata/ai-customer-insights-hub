{{ config(materialized='view') }}

with source as (

    select * from {{ source('raw', 'customers') }}

),

renamed as (

select
        id as customer_id,
        name as customer_name,
        segment,
        signup_date::timestamp as signup_date,
        region
    from source

)

select * from renamed

{{ config(materialized='view') }}

with source as (

    select * from {{ source('raw', 'orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        order_date::timestamp as order_date,
        amount::float as amount,
        status
    from source

)

select * from renamed


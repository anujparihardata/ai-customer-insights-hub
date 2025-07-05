{{ config(materialized='view') }}

with source as (

    select * from {{ source('raw', 'interactions') }}

),

renamed as (

    select
        interaction_id,
        customer_id,
        channel,
        interaction_date::timestamp as interaction_date,
        topic
    from source

)

select * from renamed

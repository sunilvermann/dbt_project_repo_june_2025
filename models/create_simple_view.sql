{{
    config(
        materialized='view'
    )
}}

SELECT * FROM {{ source('raw_src', 'CUSTOMER') }}
{{
    config(
        materialized='view', secure=true
    )
}}

SELECT * FROM {{ source('raw_src', 'CUSTOMER') }}
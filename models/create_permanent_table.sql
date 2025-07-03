-- CREATE PERMANENT TABLE IN dbt
{{
    config(
        materialized='table', transient=false
    )
}}

SELECT * FROM {{ source('raw_src', 'CUSTOMER') }}
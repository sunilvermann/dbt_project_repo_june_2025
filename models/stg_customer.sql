{{
    config(
        materialized='view'
    )
}}

WITH SOURCE AS (
    SELECT * FROM {{ source('raw_src', 'CUSTOMER') }}
)
SELECT 
ID AS CUSTOMER_ID,
	NAME CUST_NAME,
	EMAIL CUST_EMAIL,
	REGION ,
	CREATED_AT,
	UPDATED_AT,
 FROM SOURCE
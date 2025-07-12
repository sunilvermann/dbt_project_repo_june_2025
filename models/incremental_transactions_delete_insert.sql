--3. Delete+Insert Strategy (Full Refresh of Recent Data)
{{
  config(
    materialized='incremental',
    unique_key='trans_id',
    incremental_strategy='delete+insert'
  )
}}

SELECT
    trans_id,
    customer_id,
    product_id,
    amount,
    transaction_date,
    status,
    last_updated
FROM {{ source('raw_src', 'TRANSACTIONS') }}
{% if is_incremental() %}
  -- Refresh transactions from the last 1 day
  WHERE transaction_date >= DATEADD(day, -1, CURRENT_DATE)
{% endif %}

-- Join the orders and payments table
/* SELECT o.* FROM {{ source('raw_src', 'ORDERS') }} o
INNER JOIN {{ source('raw_src', 'PAYMENTS') }} p
ON o.ID = p.ID */

-- OR 
-- Here we refers the stg_orders and stg_payments models and join them
WITH ORDERS
      AS (SELECT * FROM {{ ref('stg_orders') }}),
      PAYMENTS 
      AS (SELECT * FROM {{ ref('stg_payments') }})
SELECT 
      O.ORDER_ID,      
	  O.CUSTOMER_ID,
	  O.STATUS,
	  O.ORDER_DATE,
	  O.TOTAL_AMOUNT,
      P.AMOUNT AS PAYMENT_AMOUNT,
      P.PAYMENT_METHOD,
      P.PAYMENT_DATE
FROM ORDERS O
LEFT JOIN PAYMENTS P
    ON O.ORDER_ID = P.ORDER_ID      
           

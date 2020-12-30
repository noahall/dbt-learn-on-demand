-- The total amount should always be >= 0, even in the case of a refund
-- Therefore return records where this isn't true to make the test fail.

SELECT 
    order_id,
    SUM(amount_usd) AS total_amount_usd
FROM {{ ref('stg_payments') }}
GROUP BY 1
HAVING total_amount_usd < 0
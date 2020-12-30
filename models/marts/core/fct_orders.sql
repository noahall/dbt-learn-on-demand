SELECT 
    a.order_id,
    a.customer_id,
    a.order_date,
    SUM(CASE WHEN b.status = 'success' THEN b.amount_usd END) AS purchase_amount_usd,
    a.status AS order_status
FROM {{ ref('stg_orders') }} a
LEFT JOIN {{ ref('stg_payments') }} b ON a.order_id = b.order_id
GROUP BY 1, 2, 3, 5
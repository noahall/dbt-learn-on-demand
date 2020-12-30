SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    status,
    (amount / 100::float) AS amount_usd,
    created AS payment_date
FROM {{ source('stripe', 'payment') }}
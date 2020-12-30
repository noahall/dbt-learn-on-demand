WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS most_recent_order_date,
        COUNT(order_id) AS number_of_orders,
        SUM(purchase_amount_usd) AS lifetime_value
    FROM {{ ref('fct_orders') }}
    GROUP BY 1
)

    SELECT 
        a.customer_id,
        a.first_name,
        a.last_name,
        b.first_order_date,
        b.most_recent_order_date,
        COALESCE(b.number_of_orders, 0) AS number_of_orders,
        COALESCE(b.lifetime_value, 0) AS lifetime_value
    FROM {{ ref('stg_customers') }} a
    LEFT JOIN customer_orders b ON a.customer_id = b.customer_id
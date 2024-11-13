WITH stg_order_items AS (
    SELECT * FROM {{ref('stg_order_items')}}
),

stg_orders AS (
    SELECT * FROM {{ref('stg_orders')}}
),

final AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY oi.item_id, oi.order_id) AS transaction_id,
        oi.product_id,
        o.customer_id,
        o.store_id,
        o.staff_id,
        oi.order_id AS date_id,
        oi.quantity,
        oi.list_price,
        oi.discount,
        oi.total_price
    FROM stg_order_items oi
    JOIN stg_orders o ON oi.order_id = o.order_id
)

SELECT * FROM final
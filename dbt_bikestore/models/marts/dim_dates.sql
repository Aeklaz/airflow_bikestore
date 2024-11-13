WITH stg_orders AS (
    SELECT * FROM {{ref('stg_orders')}}
),

final AS(
    SELECT
        order_id AS date_id,
        order_status,
        order_date,
        required_date,
        shipped_date
    FROM stg_orders
)

SELECT * FROM final
WITH dim_products AS (
    SELECT * FROM {{ref('dim_products')}}
),

fct_sales AS (
    SELECT * FROM {{ref('fct_sales')}}
),

final AS (
    SELECT 
        fs.product_id,
        dp.product_name,
        COUNT(fs.product_id) AS product_sold_count
    FROM fct_sales fs 
    JOIN dim_products dp ON fs.product_id = dp.product_id
    GROUP BY fs.product_id, dp.product_name
    ORDER BY COUNT(fs.product_id) DESC
)

SELECT * FROM final
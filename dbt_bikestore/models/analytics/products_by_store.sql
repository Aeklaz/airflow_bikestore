WITH dim_products AS (
    SELECT * FROM {{ref('dim_products')}}
),

dim_stores AS (
    SELECT * FROM {{ref('dim_stores')}}
),

fct_sales AS (
    SELECT * FROM {{ref('fct_sales')}}
),

final AS (
    SELECT 
        fs.product_id,
        dp.product_name,
        ds.store_name,
        COUNT(fs.product_id) AS product_sold_count
    FROM fct_sales fs 
    JOIN dim_products dp ON fs.product_id = dp.product_id
    JOIN dim_stores ds ON fs.store_id = ds.store_id
    GROUP BY fs.product_id, dp.product_name, ds.store_name
    ORDER BY COUNT(fs.product_id) DESC, ds.store_name
)

SELECT * FROM final
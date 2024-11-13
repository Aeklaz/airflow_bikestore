WITH fct_sales AS (
    SELECT * FROM {{ref('fct_sales')}}
),

dim_stores AS (
    SELECT * FROM {{ref('dim_stores')}}
),

final AS (
    SELECT 
        fs.store_id,
        ds.store_name,
        ROUND(SUM(fs.total_price), 2) AS store_revenue
    FROM fct_sales fs
    JOIN dim_stores ds ON fs.store_id = ds.store_id
    GROUP BY fs.store_id, ds.store_name
    ORDER BY ROUND(SUM(fs.total_price), 2) DESC
)

SELECT * FROM final

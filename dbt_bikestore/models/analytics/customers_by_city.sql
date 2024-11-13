WITH dim_customers AS (
    SELECT * FROM {{ref('dim_customers')}}
),

fct_sales AS (
    SELECT * FROM {{ref('fct_sales')}}
),

final AS (
    SELECT 
        dc.city,
        COUNT(fs.customer_id) AS number_of_customers
    FROM fct_sales fs
    JOIN dim_customers dc ON fs.customer_id = dc.customer_id
    GROUP BY dc.city
    ORDER BY COUNT(fs.customer_id) DESC
)

SELECT * FROM final
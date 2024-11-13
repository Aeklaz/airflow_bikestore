WITH fct_sales AS (
    SELECT * FROM {{ref('fct_sales')}}
),

dim_dates AS (
    SELECT * FROM {{ref('dim_dates')}}
),

final AS(
    SELECT 
        dd.order_date,
        ROUND(SUM(fs.total_price), 2) AS daily_revenue
    FROM fct_sales fs 
    JOIN dim_dates dd 
        ON fs.date_id = dd.date_id
    GROUP BY dd.order_date
    ORDER BY dd.order_date
)

SELECT * FROM final
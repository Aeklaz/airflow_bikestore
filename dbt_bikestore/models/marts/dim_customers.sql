WITH stg_customers AS (
    SELECT * FROM {{ref('stg_customers')}}
),

final AS (
    SELECT 
        customer_id,
        full_name,
        city,
        state,
        zip_code
    FROM stg_customers
)

SELECT * FROM final
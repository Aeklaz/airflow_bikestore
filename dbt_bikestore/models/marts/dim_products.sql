WITH stg_products AS (
    SELECT * FROM {{ref('stg_products')}}
),

stg_categories AS (
    SELECT * FROM {{ref('stg_categories')}}
),

stg_brands AS (
    SELECT * FROM {{ref('stg_brands')}}
),

final AS (
    SELECT 
        p.product_id,
        p.product_name,
        c.category_name,
        b.brand_name,
        p.model_year,
        p.list_price
    FROM stg_products p
    JOIN stg_categories c ON p.category_id = c.category_id
    JOIN stg_brands b ON p.brand_id = b.brand_id
)

SELECT * FROM final
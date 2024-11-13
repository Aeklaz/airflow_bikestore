WITH stg_stores AS (
    SELECT * FROM {{ref('stg_stores')}}
),

final AS(
    SELECT 
        store_id,
        store_name,
        city,
        state,
        zip_code
    FROM stg_stores
)

SELECT * FROM final
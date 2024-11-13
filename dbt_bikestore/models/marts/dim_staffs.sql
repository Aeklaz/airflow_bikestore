WITH stg_staffs AS (
    SELECT * FROM {{ref('stg_staffs')}}
),

stg_stores AS(
    SELECT * FROM {{ref('stg_stores')}}
),

final AS (
    SELECT 
        stf.staff_id,
        stf.full_name,
        str.store_name AS works_at,
        stf.staff_status,
        stf.manager_name
    FROM stg_staffs stf
    JOIN stg_stores str 
        ON stf.store_id = str.store_id 
)

SELECT * FROM final
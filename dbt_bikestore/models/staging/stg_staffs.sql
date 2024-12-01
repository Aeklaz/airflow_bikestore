SELECT 
    e.staff_id,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name,
    e.email AS staff_email,
    e.phone AS staff_phone,
    CASE 
        WHEN e.active = 1 THEN 'active'
        ELSE 'not active'
    END AS staff_status,
    e.store_id,
    e.manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
FROM {{source('bikestore_sales_raw', 'staffs')}} e
LEFT JOIN {{source('bikestore_sales_raw', 'staffs')}} m
ON e.manager_id = m.staff_id
ORDER BY e.staff_id
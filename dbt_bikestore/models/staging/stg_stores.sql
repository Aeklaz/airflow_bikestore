SELECT 
    store_id,
    store_name,
    phone AS store_phone,
    email AS store_email,
    street,
    city,
    state,
    zip_code
FROM {{source('bikestore_raw', 'stores_raw')}}
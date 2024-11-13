SELECT 
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    phone AS customer_phone,
    email AS customer_email,
    street,
    city,
    state,
    zip_code
FROM {{source('bikestore_raw', 'customers_raw')}}
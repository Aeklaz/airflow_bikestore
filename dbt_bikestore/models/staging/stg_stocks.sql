SELECT 
    store_id,
    product_id,
    quantity AS store_quantity
FROM {{source('bikestore_raw', 'stocks')}}
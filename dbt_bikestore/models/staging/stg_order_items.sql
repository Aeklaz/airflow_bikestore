SELECT 
    *,
    (list_price - list_price*discount)*quantity AS total_price
FROM {{source('bikestore_raw', 'order_items')}}
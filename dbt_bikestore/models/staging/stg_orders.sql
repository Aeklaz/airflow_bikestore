SELECT
    order_id,
    customer_id,
    store_id,
    staff_id,
    order_status,
    order_date,
    required_date,
    shipped_date
FROM {{source('bikestore_raw', 'orders_raw')}}
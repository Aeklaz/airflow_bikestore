/* 
we will load the data from csv files into the bikestore postgres DB
*/

COPY production.categories(category_id,category_name)
FROM '/datasets/production_categories.csv'
DELIMITER ','
CSV HEADER;

COPY production.brands(brand_id,brand_name)
FROM '/datasets/production_brands.csv'
DELIMITER ','
CSV HEADER;

COPY production.products(product_id,product_name,brand_id,category_id,model_year,list_price)
FROM '/datasets/production_products.csv'
DELIMITER ','
CSV HEADER;

COPY sales.stores(store_id,store_name,phone,email,street,city,state,zip_code)
FROM '/datasets/sales_stores.csv'
DELIMITER ','
CSV HEADER;

COPY production.stocks(store_id,product_id,quantity)
FROM '/datasets/production_stocks.csv'
DELIMITER ','
CSV HEADER;

COPY sales.customers(customer_id,first_name,last_name,phone,email,street,city,state,zip_code)
FROM '/datasets/sales_customers.csv'
DELIMITER ','
CSV HEADER;

COPY sales.staffs(staff_id,first_name,last_name,email,phone,active,store_id,manager_id)
FROM '/datasets/sales_staffs.csv'
DELIMITER ','
CSV HEADER;

COPY sales.orders(order_id,customer_id,order_status,order_date,required_date,shipped_date,store_id,staff_id)
FROM '/datasets/sales_orders.csv'
DELIMITER ','
CSV HEADER;

COPY sales.order_items(order_id,item_id,product_id,quantity,list_price,discount)
FROM '/datasets/sales_order_items.csv'
DELIMITER ','
CSV HEADER;

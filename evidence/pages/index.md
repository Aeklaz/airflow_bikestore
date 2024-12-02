# This is bikestore data pipeline dashboard!

## Revenue per day chart 
```sql revenue_by_day
SELECT * FROM analytics.revenue_by_day
```
<DataTable data={revenue_by_day} /> 

<AreaChart data={revenue_by_day} 
x="order_date" 
y="daily_revenue"
title="Sales per day"
/>

## Revenue per week chart
```sql revenue_by_week
SELECT * FROM analytics.revenue_by_week
```

<DataTable data={revenue_by_week} />

<AreaChart data={revenue_by_week} 
x="week" 
y="weekly_revenue"
title="Sales per week"
/>

## Revenue per store chart
 ```sql revenue_by_store
SELECT * FROM analytics.revenue_by_store
```

<DataTable data={revenue_by_store} />

<BarChart data={revenue_by_store}
x="store_name"
y="store_revenue"
title="Sales per store"
/>

## Products sold by brand 
 ```sql products_sold_by_brand
SELECT * FROM analytics.products_sold_by_brand
```

<DataTable data={products_sold_by_brand} />

<BarChart data={products_sold_by_brand}
x="brand_name"
y="product_sold_count"
title="Products by brand"
/>

## Products sold per store chart
 ```sql products_by_store
SELECT * FROM analytics.products_by_store
```

<DataTable data={products_by_store} />

<BarChart data={products_by_store}
x="store_name"
y="product_sold_count"
title="Products per store"
/>

## Most popular products chart
 ```sql most_sold_products
SELECT * FROM analytics.most_sold_products
limit 10
```

<DataTable data={most_sold_products} />

<BarChart data={most_sold_products}
x="product_name"
y="product_sold_count"
title="Popular Products"
/>

## Customers by city chart
 ```sql customers_by_city
SELECT * FROM analytics.customers_by_city
```

<DataTable data={customers_by_city} />

<AreaChart data={customers_by_city}
x="city"
y="number_of_customers"
title="Customers by city"
/>
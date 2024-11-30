# Hands on : Bikestore analytics

## Description

In this hands-on project, we will dive deep into the analysis of bikestore data, leveraging a comprehensive data engineering pipeline to derive valuable insights. We will ingets the bikestore data stored in a PostgreSQL database running in a Docker container, and then build a scalable data platform to extract, load, process, and visualize the data.

### Bikestore data Overview

The BikeStores database is composed of two main schemas: `sales` and `production`. The schema structure and entity relationships are designed to support the core operations of a retail business, including customer management, sales order processing, inventory control, and product catalog management.

![BikeStore Database Diagram](./img/bikestore_db_diagram.png)

#### Sales Schema

The `sales` schema contains the following tables:

1. **customers**: Stores customer information such as name, contact details, and address.
2. **orders**: Captures sales order details, including the customer, order status, order date, required date, and shipped date. Each order is associated with a store and a staff member.
3. **order_items**: Stores the individual line items for each sales order, including the product, quantity, list price, and any discounts.
4. **stores**: Maintains the details of each store location, including the store name, contact information, and address.
5. **staffs**: Holds information about store employees, including their first and last names, email, phone, and the store they work at. It also tracks the manager they report to.

The key relationships in the sales schema are:
- A customer can place multiple orders.
- Each order is placed at a specific store by a staff member.
- An order can have multiple line items, each representing a product purchased.
- A staff member can be associated with a single store and can report to a manager.

## Production Schema

The `production` schema contains the following tables:

1. **categories**: Stores the different product categories, such as children's bicycles, comfort bikes, and electric bikes.
2. **brands**: Maintains the information about bicycle brands, like Electra, Haro, and Heller.
3. **products**: Holds the details of each product, including the name, brand, category, model year, and list price.
4. **stocks**: Tracks the inventory levels of each product at each store.

The key relationships in the production schema are:
- A product belongs to a single brand and category.
- A store can have stock levels for multiple products.


-- BASE MODE
-- 1. Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip
FROM "customers"
JOIN "addresses" ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT orders.id, quantity, description
FROM "orders"
JOIN "line_items" ON orders.id = line_items.order_id
JOIN "products" on line_items.product_id = products.id;

-- 3. Which warehouses have cheetos?
SELECT description, warehouse
FROM "products"
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT description, warehouse
FROM "products"
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

-- 6. How many customers do we have?

-- 7.How many products do we carry?

-- 8. What is the total available on-hand quantity of diet pepsi?

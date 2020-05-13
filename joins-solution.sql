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
SELECT warehouse, description
FROM "products"
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT warehouse, description
FROM "products"
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, customers.last_name, COUNT(*) AS orders
FROM "orders"
JOIN "addresses" ON orders.address_id = addresses.id
JOIN "customers" ON addresses.customer_id = customers.id
GROUP BY customers.first_name, customers.last_name;

-- 6. How many customers do we have?
SELECT COUNT(*) 
FROM "customers";

-- 7.How many products do we carry?
SELECT COUNT(*) 
FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand)
FROM "warehouse_product"
JOIN "products" ON warehouse_product.product_id = products.id
WHERE description = 'diet pepsi';

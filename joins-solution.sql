-- 1. Get all customers and their addresses.
SELECT * FROM customers, addresses;


-- 2.Get all orders and their line items (orders, quantity and product).
SELECT products.description, orders.order_date, line_items.quantity FROM line_items
jOIN orders ON line_items.order_id = orders.id
JOIN products ON line_items.product_id = products.id;


-- 3. Which warehouses have cheetos?
SELECT warehouse.warehouse FROM warehouse 
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'cheetos';
Delta


-- 4. Which warehouses have diet pepsi?
SELECT warehouse.warehouse FROM warehouse 
JOIN warehouse_product ON warehouse_product.warehouse_id = warehouse.id
JOIN products ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi';
Alpha, Delta, Gamma


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, count(orders.id) FROM customers
JOIN addresses ON addresses.customer_id = customers.id
JOIN orders ON orders.address_id = addresses.id
GROUP by customers.first_name;


-- 6. How many customers do we have?
SELECT count(customers.id) FROM customers;
4


-- 7. How many products do we carry?
SELECT count(products.id) FROM products;
7

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT products.description, sum(line_items.quantity) FROM line_items
JOIN products ON products.id = line_items.product_id
WHERE products.description= 'diet pepsi'
GROUP BY products.description;
12

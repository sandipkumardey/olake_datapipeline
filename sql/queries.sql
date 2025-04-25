-- Show all orders
SELECT * FROM demo.olake_orders.orders;

-- Count orders by product
SELECT product_name, COUNT(*) as order_count, SUM(quantity) as total_quantity 
FROM demo.olake_orders.orders 
GROUP BY product_name 
ORDER BY order_count DESC;

-- Recent orders
SELECT * FROM demo.olake_orders.orders 
WHERE order_date >= '2025-01-01' 
ORDER BY order_date DESC;

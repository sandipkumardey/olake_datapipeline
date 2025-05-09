-- Create database if not exists
CREATE DATABASE IF NOT EXISTS olake_orders;
USE olake_orders;

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Insert sample data
INSERT INTO orders (customer_name, product_name, quantity, order_date, total_amount) VALUES
    ('John Doe', 'Laptop', 1, '2024-03-01', 1299.99),
    ('Jane Smith', 'Smartphone', 2, '2024-03-02', 1599.98),
    ('Bob Johnson', 'Headphones', 3, '2024-03-03', 299.97),
    ('Alice Brown', 'Tablet', 1, '2024-03-04', 499.99),
    ('Charlie Wilson', 'Smartwatch', 2, '2024-03-05', 399.98),
    ('Diana Miller', 'Laptop', 1, '2024-03-06', 1299.99),
    ('Edward Davis', 'Smartphone', 1, '2024-03-07', 799.99),
    ('Fiona Clark', 'Headphones', 2, '2024-03-08', 199.98),
    ('George White', 'Tablet', 1, '2024-03-09', 499.99),
    ('Hannah Lee', 'Smartwatch', 1, '2024-03-10', 199.99); 
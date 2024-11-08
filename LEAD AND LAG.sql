CREATE DATABASE LL;
USE LL;

CREATE TABLE sales_data_LL (
    id INT PRIMARY KEY,
    sale_date DATE,
    product_name VARCHAR(50),
    quantity_sold INT,
    revenue DECIMAL(10, 2)
);

INSERT INTO sales_data_LL (id, sale_date, product_name, quantity_sold, revenue) VALUES
(1, '2024-09-01', 'Laptop', 5, 5000.00),
(2, '2024-09-02', 'Mouse', 10, 200.00),
(3, '2024-09-03', 'Keyboard', 8, 400.00),
(4, '2024-09-04', 'Monitor', 3, 900.00),
(5, '2024-09-05', 'Laptop', 2, 2000.00),
(6, '2024-09-06', 'Mouse', 15, 300.00),
(7, '2024-09-07', 'Keyboard', 12, 600.00),
(8, '2024-09-08', 'Monitor', 5, 1500.00);

SELECT * FROM SALES_DATA_LL;

#LAG()
SELECT id, sale_date, product_name, revenue,
LAG(revenue, 1) OVER (ORDER BY sale_date) AS previous_day_revenue
FROM sales_data_LL;

#LEAD()
SELECT id, sale_date, product_name, revenue,
LEAD(revenue, 1) OVER (ORDER BY sale_date) AS next_day_revenue
FROM sales_data_LL;
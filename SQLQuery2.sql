-- 1. Total Revenue
SELECT 
    ROUND(SUM(price), 2) AS Total_Revenue
FROM order_items;

-- 2. Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM orders;

-- 3. Orders by Status
SELECT 
    order_status,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_status
ORDER BY Total_Orders DESC;

-- 4. Revenue by Year
SELECT 
    order_year,
    ROUND(SUM(price), 2) AS Revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY order_year
ORDER BY order_year;

-- 5. Top 5 Product Categories by Revenue
SELECT TOP 5
    product_category_name AS Category,
    ROUND(SUM(price), 2) AS Revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY product_category_name
ORDER BY Revenue DESC;
-- 6. Average delivery days
SELECT 
    ROUND(AVG(DATEDIFF(day, 
        order_purchase_timestamp, 
        order_delivered_customer_date)), 2) 
        AS Avg_Delivery_Days
FROM orders
WHERE order_status = 'delivered';

-- 7. Monthly revenue trend
SELECT 
    order_month,
    ROUND(SUM(price), 2) AS Monthly_Revenue,
    COUNT(DISTINCT o.order_id) AS Total_Orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month;

-- 8. Top 5 sellers by revenue
SELECT TOP 5
    seller_id,
    ROUND(SUM(price), 2) AS Total_Revenue,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM order_items
GROUP BY seller_id
ORDER BY Total_Revenue DESC;

-- 9. Payment type analysis
SELECT 
    payment_type,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(payment_value), 2) AS Total_Value,
    ROUND(AVG(payment_value), 2) AS Avg_Value
FROM payments
GROUP BY payment_type
ORDER BY Total_Transactions DESC;

-- 10. Customer review analysis
SELECT 
    review_score,
    COUNT(*) AS Total_Reviews,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM reviews
GROUP BY review_score
ORDER BY review_score DESC;
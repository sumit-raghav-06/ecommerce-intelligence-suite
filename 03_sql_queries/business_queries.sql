============================================================
E-COMMERCE — ALL SQL QUERIES
============================================================


------------------------------------------------------------
1. Database Tables Test
------------------------------------------------------------
SELECT name FROM sqlite_master
WHERE type='table';


------------------------------------------------------------
2. Total Revenue
------------------------------------------------------------
SELECT
    ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM order_items;


------------------------------------------------------------
3. Total Orders
------------------------------------------------------------
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;


------------------------------------------------------------
4. Total Customers
------------------------------------------------------------
SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;


------------------------------------------------------------
5. Average Order Value
------------------------------------------------------------
SELECT
    ROUND(AVG(price + freight_value), 2) AS avg_order_value
FROM order_items;


------------------------------------------------------------
6. Top 10 Revenue-Generating Product Categories
------------------------------------------------------------
SELECT
    p.product_category_name AS product_category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


------------------------------------------------------------
7. Most Ordered Product Categories
------------------------------------------------------------
SELECT
    p.product_category_name,
    COUNT(oi.order_id) AS total_orders
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;


------------------------------------------------------------
8. Most Expensive Product Categories (Highest Avg Price)
------------------------------------------------------------
SELECT
    p.product_category_name,
    ROUND(AVG(oi.price), 2) AS avg_product_price
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_product_price DESC
LIMIT 10;


------------------------------------------------------------
9. Products with Highest Order Frequency
------------------------------------------------------------
SELECT
    p.product_category_name,
    COUNT(oi.order_id) AS total_orders
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.product_id, p.product_category_name
ORDER BY total_orders DESC
LIMIT 10;


------------------------------------------------------------
10. Most Active Customer Cities
------------------------------------------------------------
SELECT
    c.customer_city AS City,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_city
ORDER BY total_orders DESC
LIMIT 10;


------------------------------------------------------------
11. Top Revenue-Generating States
------------------------------------------------------------
SELECT
    c.customer_state,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC
LIMIT 10;


------------------------------------------------------------
12. Top 10 Customers by Total Spending
------------------------------------------------------------
SELECT
    c.customer_unique_id,
    ROUND(SUM(price + freight_value), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;


------------------------------------------------------------
13. Most Used Payment Methods
------------------------------------------------------------
SELECT
    payment_type,
    COUNT(order_id) AS total_orders
FROM payments
WHERE payment_type != 'not_defined'
GROUP BY payment_type
ORDER BY total_orders DESC;


------------------------------------------------------------
14. Average Installment Usage
------------------------------------------------------------
SELECT
    ROUND(AVG(payment_installments), 2) AS avg_installments
FROM payments;


------------------------------------------------------------
15. Payment Type vs Average Order Value
------------------------------------------------------------
SELECT
    payment_type,
    ROUND(AVG(payment_value), 2) AS avg_order_value
FROM payments
GROUP BY payment_type
ORDER BY avg_order_value DESC;


------------------------------------------------------------
16. Average Delivery Time (in Days)
------------------------------------------------------------
WITH delivery_time_cte AS (
    SELECT
        order_id,
        JULIANDAY(order_delivered_customer_date) -
        JULIANDAY(order_purchase_timestamp) AS delivery_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
)
SELECT
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM delivery_time_cte;


------------------------------------------------------------
17. Delayed Deliveries Count
------------------------------------------------------------
WITH delayed_orders_cte AS (
    SELECT
        order_id,
        order_delivered_customer_date,
        order_estimated_delivery_date
    FROM orders
    WHERE order_delivered_customer_date > order_estimated_delivery_date
)
SELECT
    COUNT(order_id) AS delayed_orders
FROM delayed_orders_cte;


------------------------------------------------------------
18. Early Deliveries Count
------------------------------------------------------------
WITH early_delivery_cte AS (
    SELECT
        order_id
    FROM orders
    WHERE order_delivered_customer_date < order_estimated_delivery_date
)
SELECT
    COUNT(order_id) AS early_deliveries
FROM early_delivery_cte;


------------------------------------------------------------
19. Monthly Revenue Trend (Last 10 Months)
------------------------------------------------------------
SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month DESC
LIMIT 10;


------------------------------------------------------------
20. RFM Customer Segmentation
------------------------------------------------------------
WITH rfm_base AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_purchase,
        COUNT(DISTINCT o.order_id)      AS frequency,
        ROUND(SUM(p.payment_value), 2)  AS monetary
    FROM orders o
    JOIN customers c ON o.customer_id = c.customer_id
    JOIN payments p  ON o.order_id    = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
),
rfm_scored AS (
    SELECT *,
        NTILE(4) OVER (ORDER BY last_purchase DESC) AS r_score,
        NTILE(4) OVER (ORDER BY frequency DESC)     AS f_score,
        NTILE(4) OVER (ORDER BY monetary DESC)      AS m_score
    FROM rfm_base
)
SELECT
    CASE
        WHEN r_score = 4 AND f_score = 4 THEN 'Champion'
        WHEN r_score = 4 AND f_score = 3 THEN 'Loyal'
        WHEN r_score >= 3 AND f_score >= 3 THEN 'Potential Loyal'
        WHEN r_score = 4 AND f_score = 1 THEN 'New Customer'
        WHEN r_score <= 2 AND f_score <= 2 THEN 'At Risk'
        ELSE 'Needs Attention'
    END AS customer_segment,
    COUNT(*) AS total_customers
FROM rfm_scored
GROUP BY customer_segment
ORDER BY total_customers DESC;


============================================================
END OF FILE — 20 Queries Total
============================================================

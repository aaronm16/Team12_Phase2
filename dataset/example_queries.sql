-- Query 1: feature/index-focused
-- Both systems
SELECT order_id, customer_id, order_date, total_amount
FROM orders
WHERE region = 'West'
  AND order_date BETWEEN '2025-01-01' AND '2025-03-31 23:59:59'
ORDER BY order_date DESC
LIMIT 50;

-- Query 2: workload/performance-focused
-- Both systems
SELECT p.category,
       COUNT(*) AS line_count,
       SUM(oi.quantity) AS units_sold,
       ROUND(SUM(oi.quantity * oi.unit_price), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_date BETWEEN '2024-06-01' AND '2025-03-31 23:59:59'
  AND o.status IN ('shipped', 'delivered')
GROUP BY p.category
ORDER BY revenue DESC;

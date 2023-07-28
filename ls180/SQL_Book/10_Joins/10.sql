SELECT sum(p.product_cost)
FROM customers AS c JOIN orders as o
ON c.id = o.customer_id
JOIN order_items AS oi
ON o.id = oi.order_id
JOIN products AS p
ON oi.product_id = p.id
WHERE c.customer_name = 'Natasha O''Shea';
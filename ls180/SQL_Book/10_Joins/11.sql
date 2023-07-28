SELECT p.product_name, COUNT(oi.id)
FROM products AS p JOIN order_items AS oi
ON p.id = oi.product_id
GROUP BY p.product_name
ORDER BY p.product_name ASC;
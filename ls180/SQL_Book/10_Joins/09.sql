SELECT DISTINCT c.customer_name AS "Customers who like Fries"
  FROM customers AS c JOIN orders AS o
  ON c.id = o.customer_id
  JOIN order_items AS oi
  ON o.id = oi.order_id
  JOIN products AS p
  ON p.id = oi.product_id
  WHERE p.product_name = 'Fries';
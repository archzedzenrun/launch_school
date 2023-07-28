SELECT o.id
  FROM orders AS o JOIN order_items AS oi
  ON o.id = oi.order_id
  JOIN products AS p
  ON p.id = oi.product_id
  WHERE p.product_name = 'Fries';
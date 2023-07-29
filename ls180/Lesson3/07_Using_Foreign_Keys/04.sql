SELECT orders.quantity, products.name
  FROM orders INNER JOIN products
  ON orders.product_id = products.id;
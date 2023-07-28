SELECT orders.*, products.*
  FROM orders JOIN order_items
  ON orders.id = order_items.order_id
  JOIN products
  ON products.id = order_items.product_id;
SELECT side_cost FROM orders
  WHERE side IS NOT NULL
  ORDER BY side_cost LIMIT 1;

SELECT min(side_cost) FROM orders
  WHERE side IS NOT NULL;
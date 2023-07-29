SELECT customers.id, customers.email, count(DISTINCT tickets.event_id)
  FROM customers INNER JOIN tickets
  ON tickets.customer_id = customers.id
  GROUP BY customers.id
  HAVING count(DISTINCT tickets.event_id) = 3;
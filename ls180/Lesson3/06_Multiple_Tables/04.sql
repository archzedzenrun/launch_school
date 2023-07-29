SELECT round( COUNT(DISTINCT tickets.customer_id)
            / COUNT(DISTINCT customers.id)::decimal * 100,
            2)
       AS percent
  FROM customers
  LEFT OUTER JOIN tickets
    ON tickets.customer_id = customers.id;
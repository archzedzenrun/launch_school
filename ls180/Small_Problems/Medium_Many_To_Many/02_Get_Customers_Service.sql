SELECT DISTINCT customers.id, customers.name, customers.payment_token
  FROM customers INNER JOIN customers_services
  ON customers.id = customers_services.customer_id;
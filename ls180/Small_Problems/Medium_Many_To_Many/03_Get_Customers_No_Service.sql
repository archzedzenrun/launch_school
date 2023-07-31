SELECT DISTINCT customers.*
  FROM customers INNER JOIN customers_services
  ON customers.id = customers_services.customer_id
  WHERE customers_services.service_id IS NULL;

--Further Exploration:

SELECT customers.*, services.*
  FROM customers FULL OUTER JOIN customers_services
  ON customers.id = customers_services.customer_id

  FULL OUTER JOIN services
  ON services.id = customers_services.service_id
  WHERE customers_services.service_id IS NULL OR customers_services.customer_id IS NULL;
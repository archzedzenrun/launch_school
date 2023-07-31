SELECT sum(price) AS gross
  FROM services INNER JOIN customers_services
  ON services.id = customers_services.service_id;
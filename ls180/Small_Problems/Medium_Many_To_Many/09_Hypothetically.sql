SELECT sum(price)
  FROM services INNER JOIN customers_services
  ON services.id = customers_services.service_id
  WHERE price > 100.00;

SELECT sum(price)
  FROM customers CROSS JOIN services
  WHERE price > 100.00;

--Using sub query:

SELECT sum(price) * (SELECT count(id) FROM customers) AS sum
  FROM services
  WHERE price >= 100;
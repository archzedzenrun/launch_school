ALTER TABLE orders
  ALTER COLUMN product_id
  SET NOT NULL;

--This will result in an error because there is a NULL value in one or more rows.
CREATE TABLE orders(
  id serial PRIMARY KEY,
  customer_id integer,
  order_status varchar(20),
  FOREIGN KEY (customer_id)
  REFERENCES customers (id)
  ON DELETE CASCADE
);

CREATE TABLE order_items(
  id serial PRIMARY KEY,
  order_id integer NOT NULL,
  product_id integer NOT NULL,
  FOREIGN KEY (order_id)
  REFERENCES orders (id)
  ON DELETE CASCADE,
  FOREIGN KEY (product_id)
  REFERENCES products (id)
  ON DELETE CASCADE
);
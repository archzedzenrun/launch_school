CREATE TABLE reviews(
  id serial PRIMARY KEY,
  review text NOT NULL,
  product_id integer REFERENCES products (id)
);
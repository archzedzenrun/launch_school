CREATE TABLE moons(
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis decimal CHECK (semi_major_axis > 0),
  mass decimal CHECK (mass > 0),
  planet_id integer NOT NULL REFERENCES planets (id)
);
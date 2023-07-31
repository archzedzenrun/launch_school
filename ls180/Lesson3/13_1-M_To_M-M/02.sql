CREATE TABLE directors_films(
  id serial PRIMARY KEY,
  film_id integer
  REFERENCES films (id) ON DELETE CASCADE,
  director_id integer
  REFERENCES directors (id) ON DELETE CASCADE,
  UNIQUE(director_id, film_id)
);
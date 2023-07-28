ALTER TABLE singers
  ADD CONSTRAINT unique_id UNIQUE (id);

CREATE TABLE albums(
  id serial,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id integer,
  FOREIGN KEY (singer_id)
  REFERENCES singers (id)
);

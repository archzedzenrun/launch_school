SELECT films.title, directors.name
  FROM films INNER JOIN directors_films
  ON directors_films.film_id = films.id
  INNER JOIN directors
  ON directors_films.director_id = directors.id
  ORDER BY films.title;
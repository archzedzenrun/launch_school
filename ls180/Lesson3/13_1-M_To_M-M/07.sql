SELECT directors.name AS director, count(directors_films.director_id) AS number_of_films
FROM directors INNER JOIN directors_films
ON directors.id = directors_films.director_id
GROUP BY directors.name
ORDER BY number_of_films DESC, directors.name;
SELECT title, date_part('year', NOW()) - year AS age
  FROM films
  ORDER BY age;
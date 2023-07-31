INSERT INTO directors (name)
  VALUES ('Joel Coen'),
         ('Ethan Coen'),
         ('Frank Miller'),
         ('Robert Rodriguez');

INSERT INTO films (title, year, genre, duration)
  VALUES ('Fargo', 1996, 'comedy', 98),
         ('No Country For Old Men', 2007, 'western', 122),
         ('Sin City', 2005, 'crime', 124),
         ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors_films (film_id, director_id)
  VALUES (9, 11),
         (9, 12),
         (10, 12),
         (11, 13),
         (12, 13),
         (12, 14);
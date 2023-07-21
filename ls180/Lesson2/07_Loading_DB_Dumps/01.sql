DROP TABLE IF EXISTS public.films;
CREATE TABLE films (title varchar(255), "year" integer, genre varchar(100));

INSERT INTO films(title, "year", genre) VALUES ('Die Hard', 1988, 'action');
INSERT INTO films(title, "year", genre) VALUES ('Casablanca', 1942, 'drama');
INSERT INTO films(title, "year", genre) VALUES ('The Conversation', 1974, 'thriller');

--This file deletes the films table if it exists.
--It creates a films table with columns title, year, and genre.
--It inserts 3 different films into the films table.
ALTER TABLE celebrities
  ALTER COLUMN last_name DROP NOT NULL;

INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased)
  VALUES ('Madonna', 'Singer, Actress', '1958-08-16', DEFAULT),
         ('Prince', 'Singer, Songwriter, Musician, Actor', '1958-06-07', true);
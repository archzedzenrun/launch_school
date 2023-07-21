SELECT * FROM people
  WHERE name = 'Mu''nisah';

SELECT * FROM people
  WHERE occupation IS NULL;

SELECT * FROM people
  WHERE age = 26;

SELECT name, age, occupation FROM people
  ORDER BY age LIMIT 1;

SELECT name, age, occupation FROM people
  ORDER BY name LIMIT 1 OFFSET 2;

SELECT name, age, occupation FROM people
  ORDER BY occupation DESC LIMIT 1;
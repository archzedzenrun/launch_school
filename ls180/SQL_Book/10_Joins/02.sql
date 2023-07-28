SELECT name, capital FROM countries
  WHERE continent_id = 3;

SELECT countries.name, countries.capital
  FROM countries JOIN continents
  ON countries.continent_id = continents.id
  WHERE continent_name = 'Europe';
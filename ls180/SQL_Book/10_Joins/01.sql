SELECT countries.name, continents.continent_name
  FROM countries JOIN continents
  ON countries.continent_id = continents.id;
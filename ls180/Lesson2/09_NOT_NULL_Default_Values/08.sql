ALTER TABLE temperatures
  ALTER COLUMN rainfall
  TYPE decimal(4, 3);

UPDATE temperatures
  SET rainfall = rainfall * 0.039;
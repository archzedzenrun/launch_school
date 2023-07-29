ALTER TABLE stars
  ALTER COLUMN distance TYPE decimal;

--Further Exploration:
--Certain data types will be automatically converted into new data types (if the conversion is supported). For example integer can be converted into decimal,
--but integer cant be converted into text.
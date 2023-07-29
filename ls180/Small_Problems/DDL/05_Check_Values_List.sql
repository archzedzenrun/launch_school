ALTER TABLE stars
  ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
  ALTER COLUMN spectral_type SET NOT NULL;

--Further Exploration:
--If a column contains NULL values, they must be changed before
--a NOT NULL constraint can be added to that column.
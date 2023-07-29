ALTER TABLE planets
  ADD COLUMN semi_major_axis decimal NOT NULL;

--Adding a column with a NOT NULL constraint to a table that already has data
--will result in an error because those existing rows would have a value of --NULL for that column (which is not allowed).
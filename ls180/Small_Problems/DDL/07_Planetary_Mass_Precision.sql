ALTER TABLE planets
  ALTER COLUMN mass
  TYPE decimal,
  ALTER COLUMN mass
  SET NOT NULL,
  ADD CHECK (mass > 0.0),
  ALTER COLUMN designation
  SET NOT NULL;
ALTER TABLE films
  ADD CONSTRAINT valid_director
  CHECK (length(director) >= 3 AND director LIKE '% %');
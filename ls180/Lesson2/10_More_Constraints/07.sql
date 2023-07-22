ALTER TABLE films
  ADD CONSTRAINT title_length CHECK (length(title) > 0);
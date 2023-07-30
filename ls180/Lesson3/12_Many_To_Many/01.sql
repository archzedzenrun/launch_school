ALTER TABLE books_categories
  DROP CONSTRAINT books_categories_book_id_fkey,
  DROP CONSTRAINT books_categories_category_id_fkey,
  ADD FOREIGN KEY (book_id)
  REFERENCES books (id)
  ON DELETE CASCADE,
  ADD FOREIGN KEY (category_id)
  REFERENCES categories (id)
  ON DELETE CASCADE,
  ALTER COLUMN book_id
  SET NOT NULL,
  ALTER COLUMN category_id
  SET NOT NULL;
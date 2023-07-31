ALTER TABLE books_categories
  ADD UNIQUE (book_id, category_id);
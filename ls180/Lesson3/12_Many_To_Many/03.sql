ALTER TABLE books
  ALTER COLUMN title TYPE varchar(50),
  ALTER COLUMN author TYPE varchar(50);

INSERT INTO books (title, author)
  VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
         ('Jane Eyre', 'Charlotte Bronte'),
         ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

INSERT INTO categories (name)
  VALUES ('Space'),
         ('Exploration'),
         ('Cookbook'),
         ('South Asia');

INSERT INTO books_categories (book_id, category_id)
  VALUES (4, 5),
         (4, 1),
         (4, 7),
         (4, 8),
         (5, 2),
         (5, 4),
         (6, 9),
         (6, 1),
         (6, 10);
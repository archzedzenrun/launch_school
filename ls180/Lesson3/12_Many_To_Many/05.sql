SELECT categories.name, count(books_categories.book_id) AS book_count, string_agg(books.title, ', ') AS book_titles
  FROM books INNER JOIN books_categories
  ON books.id = books_categories.book_id
  INNER JOIN categories
  ON categories.id = books_categories.category_id
  GROUP BY categories.name
  ORDER BY categories.name;
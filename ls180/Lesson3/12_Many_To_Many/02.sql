SELECT books.id, books.author, string_agg(categories.name, ', ') AS categories
  FROM books INNER JOIN books_categories
  ON books_categories.book_id = books.id
  INNER JOIN categories
  ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id;
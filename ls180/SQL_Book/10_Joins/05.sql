SELECT singers.first_name, singers.last_name
  FROM singers LEFT JOIN albums
  ON singers.id = albums.singer_id
  WHERE albums.id IS NULL;
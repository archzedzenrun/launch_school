SELECT DISTINCT singers.first_name
  FROM singers JOIN albums
  ON singers.id = albums.singer_id
  WHERE albums.label LIKE '%Warner Bros%';
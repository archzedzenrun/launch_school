SELECT singers.first_name, singers.last_name, albums.album_name, albums.released
  FROM singers JOIN albums
  ON singers.id = albums.singer_id
  WHERE albums.released
  BETWEEN '1980-01-01' AND '1990-01-01'
  AND singers.deceased = false
  ORDER BY singers.date_of_birth DESC;
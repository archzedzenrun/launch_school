ALTER TABLE celebrities
  RENAME TO singers;

DELETE FROM singers
  WHERE occupation NOT LIKE '%Singer%';
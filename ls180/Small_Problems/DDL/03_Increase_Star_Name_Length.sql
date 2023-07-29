ALTER TABLE stars
  ALTER COLUMN name TYPE varchar(50);

--Further Exploration:
--Changing the data type to length longer than any current value wont have any effect. However, changing the length to a value lower than the length of data already in the column will result in an error.
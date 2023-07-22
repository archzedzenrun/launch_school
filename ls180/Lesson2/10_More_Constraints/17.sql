CREATE TABLE test(
  test_name varchar(25),
  test_size integer DEFAULT 0);

ALTER TABLE test
  ADD CONSTRAINT valid_size
  CHECK (test_size > 0);

INSERT INTO test (test_name)
  VALUES ('hello');

--new row for relation "test" violates check constraint "valid_size".
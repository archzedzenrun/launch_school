DELETE FROM parts
  WHERE device_id = 1;

DELETE FROM devices
  WHERE name = 'Accelerometer';

--Further Exploration:

ALTER TABLE parts
  DROP CONSTRAINT parts_device_id_fkey,
  ADD FOREIGN KEY (device_id)
  REFERENCES devices (id)
  ON DELETE CASCADE;

DELETE FROM devices
  WHERE name = 'Accelerometer';
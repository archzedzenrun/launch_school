SELECT name AS oldest_device FROM devices
  ORDER BY created_at LIMIT 1;
SELECT devices.name, count(parts.id)
  FROM devices LEFT OUTER JOIN parts
  ON parts.device_id = devices.id
  GROUP BY devices.name;
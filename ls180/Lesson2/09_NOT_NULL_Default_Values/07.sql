UPDATE temperatures
  SET rainfall = ((low + high) / 2) - 35
  WHERE ((low + high) / 2) - 35 > 0;
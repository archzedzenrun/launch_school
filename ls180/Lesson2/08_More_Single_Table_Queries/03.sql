SELECT state, count(id) FROM people
  GROUP BY state
  ORDER BY count DESC LIMIT 10;
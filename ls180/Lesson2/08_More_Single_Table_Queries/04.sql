SELECT substr(email, strpos(email, '@') + 1) AS domain, count(id)
  FROM people
  GROUP BY domain
  ORDER BY count DESC LIMIT 10;

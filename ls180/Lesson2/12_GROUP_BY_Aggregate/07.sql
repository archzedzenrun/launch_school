SELECT year / 10 * 10 as decade, ROUND(avg(duration)) AS average_duration
  FROM films
  GROUP BY decade
  ORDER BY decade;
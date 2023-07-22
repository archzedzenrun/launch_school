SELECT genre, ROUND(avg(duration)) AS average_duration FROM films
  GROUP BY genre;
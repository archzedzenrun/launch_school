SELECT date, ROUND((sum(low) + sum(high)) / 2, 1) AS average FROM temperatures
  WHERE date > '2016-03-01' AND date < '2016-03-09'
  GROUP BY date;
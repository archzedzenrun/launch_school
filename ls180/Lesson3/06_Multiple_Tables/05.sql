SELECT events.name, count(tickets.event_id) AS popularity
  FROM events JOIN tickets
  ON tickets.event_id = events.id
  GROUP BY events.name
  ORDER BY popularity DESC;
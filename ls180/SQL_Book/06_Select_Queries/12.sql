SELECT first_name, last_name FROM celebrities
  WHERE occupation LIKE '%Singer%' AND
  (occupation LIKE '%Actor%' OR
  occupation LIKE '%Actress%');
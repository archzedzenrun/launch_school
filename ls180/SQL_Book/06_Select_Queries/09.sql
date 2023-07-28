SELECT first_name, last_name FROM celebrities
  WHERE deceased != true OR deceased IS NULL;
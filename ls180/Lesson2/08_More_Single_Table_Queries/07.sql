UPDATE people
  SET given_name = UPPER(given_name)
  WHERE email LIKE '%teleworm.us';
SELECT calls.when, calls.duration, contacts.first_name
  FROM calls JOIN contacts
  ON calls.contact_id = contacts.id
  WHERE calls.contact_id != 6;
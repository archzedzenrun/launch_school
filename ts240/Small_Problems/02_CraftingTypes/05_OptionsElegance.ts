type Contact = {
  firstName: string,
  lastName: string,
  age?: number,
  isOnline?: boolean,
}

const contact: Contact = {
  firstName: 'Cruz',
  lastName: 'Hernandez',
}

const contact2: Contact = {
  firstName: 'Cruz',
  lastName: 'Hernandez',
  age: 36,
}

console.log(contact, contact2);
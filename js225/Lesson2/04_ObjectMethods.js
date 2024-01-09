let me = {};
me.firstName = 'Cruz';
me.lastName = 'Hernandez';

let mother = {
  firstName: 'Amber',
  lastName: 'Doe',
};

let father = {
  firstName: 'Shane',
  lastName: 'Doe',
};

let pippy = {
  firstName: 'Pippy',
  lastName: 'Lepoo',
}

// let people = [];

// function fullName(person) {
//   console.log(person.firstName + ' ' + person.lastName);
// }

// function rollCall(people) {
//   people.forEach(fullName);
// }

// people.push(me, mother, father);

// rollCall(people);

let people = {
  collection: [me, mother, father],
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName);
  },
  add: function(person) {
    if (this.invalidPerson(person)) return;
    this.collection.push({ firstName: person.firstName, lastName: person.lastName });
  },
  getIndex: function(person) {
    for (let i = 0; i < this.collection.length; i += 1) {
      let current = this.collection[i];
      if (current.firstName === person.firstName &&
          current.lastName === person.lastName) {
        return i;
      }
    }

    return -1;
  },
  remove: function(person) {
    if (this.invalidPerson(person)) return;
    let idx = this.getIndex(person.firstName, person.lastName);
    if (idx === -1) return;
    this.collection.splice(idx, 1);
  },
  invalidPerson: function(person) {
    return (typeof person.firstName !== 'string' || typeof person.lastName !== 'string');
  },
  get: function(person) {
    if (this.invalidPerson(person)) return;

    return this.collection[this.getIndex(person)];
  },
  update: function(person) {
    if (this.invalidPerson(person)) return;
    let existingId = this.getIndex(person);
    if (existingId === -1) {
      this.add(person);
    } else {
      this.collection[existingId] = person;
    }
  }
};

// people.rollCall();
people.add(pippy);
people.rollCall();
console.log(people.get(me))
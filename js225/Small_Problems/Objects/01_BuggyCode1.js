function createGreeter(name) {
  return {
    name,
    morning: 'Good Morning',
    afternoon: 'Good Afternoon',
    evening: 'Good Evening',
    greet(timeOfDay) {
      let msg = '';
      switch (timeOfDay) {
        case 'morning':
          msg += `${this.morning} ${name}`;
          break;
        case 'afternoon':
          msg += `${this.afternoon} ${name}`;
          break;
        case 'evening':
          msg += `${this.evening} ${name}`;
          break;
      }

      console.log(msg);
    },
  };
}

const helloVictor = createGreeter('Victor');
helloVictor.greet('morning'); //Good Morning Victor

// When greet method is invoked on the object returned by the createGreeter function, line 11 is looking for a variable morning outside of the object (which doesnt exist). We want morning (and afternoon/evening) to reference the object properties so we need to prepend them with 'this.'

// Further Exploration:
// This works because the name variable is part of the binding of the object returned from the createGreeter function.
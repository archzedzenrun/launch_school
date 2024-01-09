// PP 1
// The code will output 'undefined undefined is a undefined' because the getDescription function is invoked in the context of the logReturnVal function instead of the turk object. 'this' references the global object which doesnt have firstName, lastName, or occupation properties which is why they are undefined.

// PP 2
// let turk = {
//   firstName: 'Christopher',
//   lastName: 'Turk',
//   occupation: 'Surgeon',
//   getDescription() {
//     return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
//   }
// };

// function logReturnVal(func, context) {
//   let returnVal = func.call(context);
//   console.log(returnVal);
// }

// logReturnVal(turk.getDescription, turk);

// PP 3
// let getTurkDescription = turk.getDescription.bind(turk);
// console.log(getTurkDescription())

// PP 4
// No because 'this' has lost its context and no longer refers to the TESgames object within the callback function of forEach.

// PP 5
// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     this.titles.forEach(title => {
//       console.log(this.seriesTitle + ' ' + title);
//     });
//   }
// };

// TESgames.listGames();

// PP 6
// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     let self = this;
//     this.titles.forEach(function(title) {
//       console.log(self.seriesTitle + ' ' + title);
//     });
//   }
// };

// TESgames.listGames();

// PP 7
// let TESgames = {
//   titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
//   seriesTitle: 'The Elder Scrolls',
//   listGames() {
//     this.titles.forEach(function(title) {
//       console.log(this.seriesTitle + ' ' + title);
//     }, this);
//   }
// };

// TESgames.listGames();

// PP 8
// The value of a will still be 0 because the increment function loses its context to the foo object by being defined within the incrementA method.

// PP 9
// let foo = {
//   a: 0,
//   incrementA() {
//     // let self = this; OR
//     function increment() {
//       this.a += 1;
//     }

//     increment.call(this); // Use the call method and pass this as context
//   }
// };

// foo.incrementA();
// foo.incrementA();
// foo.incrementA();
// console.log(foo);

// PP 10
let foo = {
  a: 0,
  incrementA() {
    let increment = function() {
      this.a += 1;
    }.bind(this);

    increment();
    increment();
    increment();
  }
}

foo.incrementA()
console.log(foo)
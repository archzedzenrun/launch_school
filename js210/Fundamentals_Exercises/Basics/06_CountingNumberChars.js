let rlSync = require('readline-sync');
let phrase = rlSync.question("Please enter a phrase:\n");
let length = phrase.length;

console.log(`There are ${length} characters in "${phrase}".`)

// Further Exploration:

length = phrase.replace(/[^a-z]/gi, '').length;

// length = 0;
// for (let char of phrase) {
//   if (/[a-zA-Z]/.test(char)) {
//     length += 1;
//   }
// }

console.log(`There are ${length} alphabetic characters in "${phrase}".`)
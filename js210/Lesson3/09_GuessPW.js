// let rlSync = require('readline-sync');
// const PASSWORD = 'password'
// let answer = '';

// for (let guesses = 0; guesses < 3; guesses += 1) {
//   answer = rlSync.question("What is the password: ");
//   if (answer === PASSWORD) {
//     console.log('You have succesfully logged in.');
//     break;
//   }
// }

// if (answer !== PASSWORD) console.log('You have been denied access.');

// Alt Solution

let rlSync = require('readline-sync');
let guesses = 3;

do {
  let answer = rlSync.question("What is the password: ");
  if (answer === 'password') break;
  guesses -= 1;
} while (guesses);

console.log(guesses ? 'You have successfully logged in.' : 'You have been denied access.');
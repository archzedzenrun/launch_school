let rlSync = require('readline-sync');
let firstName = rlSync.question("What's your name?\n");
let lastName = rlSync.question("What's your last name?\n");
console.log(`Hello, ${firstName} ${lastName}!`);
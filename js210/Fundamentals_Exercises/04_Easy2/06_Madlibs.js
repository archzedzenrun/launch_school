let rlSync = require('readline-sync');

let answers = [];
let parts = ['a noun', 'a verb', 'an adjective', 'an adverb'];
parts.forEach(function(part) {
  answers.push(rlSync.question(`Enter ${part}: `));
});

console.log(`Do you ${answers[1]} your ${answers[2]} ${answers[0]} ${answers[3]}? That's hilarious!`);
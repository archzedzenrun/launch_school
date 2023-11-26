let rlSync = require('readline-sync');

let answers = ['1st', '2nd', '3rd', '4th', '5th', 'last'].map(suffix => {
  return rlSync.question(`Enter the ${suffix} number: `);
})

let lastAnswer = answers.pop();
let appears = answers.includes(lastAnswer) ? 'appears' : 'does not appear';
console.log(`The number ${lastAnswer} ${appears} in [${answers}].`);


// Further Exploration:

function isIncluded(arr, val) {
  return arr.some(num => Number(num) > Number(val));
}

console.log(isIncluded(answers, lastAnswer));
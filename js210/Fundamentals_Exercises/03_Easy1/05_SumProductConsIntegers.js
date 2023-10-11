let rlSync = require('readline-sync');
let number = Number(rlSync.question("Please enter an integer greater than 0: "));
let choice = rlSync.question('Enter "s" to compute the sum, or "p" to compute the product.');

function calcSum(num) {
  let result = 0;
  for (let i = 1; i <= num; i += 1) {
    result += i;
  }
  return result;
}

function calcProduct(num) {
  let result = 1;
  for (let i = 1; i <= num; i += 1) {
    result *= i;
  }
  return result;
}

if (choice === 's') {
  console.log(`The sum of the integers between 1 and ${number} is ${calcSum(number)}.`);
} else if (choice === 'p') {
  console.log(`The product of the integers between 1 and ${number} is ${calcProduct(number)}.`);
}
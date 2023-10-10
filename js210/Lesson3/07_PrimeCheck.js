/*
Algorithm:
-Iterate from 2 up to but not including the input
  -Return false if current num is not a multiple of the input
-Return true
*/

function isPrime(num) {
  if (num <= 1) return false;

  for (let i = 2; i < num; i += 1) {
    if (num % i === 0) return false;
  }

  return true;
}

console.log(isPrime(1));   // false
console.log(isPrime(2));   // true
console.log(isPrime(3));   // true
console.log(isPrime(43));  // true
console.log(isPrime(55));  // false
console.log(isPrime(0));   // false

// Further Exploration:

function isPrime(num) {
  if (num <= 1 || (num > 2 && num % 2 === 0)) {
    return false;
  }

  for (let i = 3; i < num; i += 2) {
    if (num % i === 0) return false;
  }

  return true;
}
/*
Input: Number

Rules:
-Find all multiples of the input between 0 up to and including 100.
-Log all of the odd multiples in descending order.
-Input will be an integer between 0 and 100.

Algorithm:
-Iterate from 100 down to 0
  -Check if current number is a multiple of the input argument
  -If it is, log it.
*/

// function logMultiples(num) {
//   for (let i = 100; i > 0; i -=1) {
//     if (i % num === 0 && i % 2 === 1) console.log(i);
//   }
// }

// logMultiples(17);
// logMultiples(21);

// Further Exploration:

function largestMultiple(num) {
  return Math.floor(100 / num) * num;
}

function logMultiples(num) {
  for (let i = largestMultiple(num); i > 0; i -= num) {
    if (i % 2 === 1) console.log(i);
  }
}

logMultiples(17);
logMultiples(21);
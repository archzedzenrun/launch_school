/*
Algorithm:
-Convert input into a string
-Split string into an array
-Iterate over array
  -Add number value of current char to a running total
-Return total
*/

function sum(number) {
  return String(number).split('')
    .reduce((total, num) => total + Number(num), 0);
}

console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45
/*
https://edabit.com/challenge/XR4suWJok9wdaNJ5j
TIME TAKEN 13:00
OG solution didnt pass test case with consecutive 0's

Write a function that moves all the zeroes to the end of an array. Do this without returning a copy of the input array.

You must mutate the original array.
Keep the relative order of the non-zero elements the same.


Input: Array
Output: Array

Rules:
-Move all zeroes in the array to the end
-Mutate the original array
-Keep other elements in the same order

-Return empty array if input is empty array
-Elements will be numbers

Questions:

Examples:
zeroesToEnd([]) // []
zeroesToEnd([0, 0, 0]) // [0, 0, 0]
zeroesToEnd([1, 2, 3]) // [1, 2, 3]
zeroesToEnd([1, 0, 2, 0, 3]) // [1, 2, 3, 0, 0]
zeroesToEnd([0, 1, 2, 3]) // [1, 2, 3, 0]
zeroesToEnd([0, 1, 2, 3, 0]) // [1, 2, 3, 0, 0]
zeroesToEnd([5, 2, 0, 1, 0, 7]) // [5, 2, 1, 7, 0, 0]

Data Structure:

Algorithm:
-Iterate through the input array
  -If current element is a 0
    -Remove it from the array and push it to the end of the array
-Return the array
*/

// OG

// function zeroesToEnd(array) {
//   for (let idx = 0; idx < array.length; idx += 1) {
//     if (array[idx] === 0) {
//       array.push(array.splice(idx, 1)[0]);
//     }
//   }

//   return array;
// }

// WORKING

function zeroesToEnd(array) {
  let nums = [];
  let zeroes = [];
  array.forEach(num => num === 0 ? zeroes.push(num) : nums.push(num));
  nums.concat(zeroes).forEach((num, idx) => array[idx] = num);
  return array;
}

let arr = [5, 2, 0, 1, 0, 7];

console.log(zeroesToEnd([])); // []
console.log(zeroesToEnd([0, 0, 0])); // [0, 0, 0]
console.log(zeroesToEnd([1, 2, 3])); // [1, 2, 3]
console.log(zeroesToEnd([1, 0, 2, 0, 3])); // [1, 2, 3, 0, 0]
console.log(zeroesToEnd([0, 1, 2, 3])); // [1, 2, 3, 0]
console.log(zeroesToEnd([0, 1, 2, 3, 0])); // [1, 2, 3, 0, 0]
console.log(zeroesToEnd([5, 2, 0, 1, 0, 7])); // [5, 2, 1, 7, 0, 0]
console.log(zeroesToEnd(arr) === arr);
console.log(zeroesToEnd([1, 2, 0, 0, 4, 0, 5]))
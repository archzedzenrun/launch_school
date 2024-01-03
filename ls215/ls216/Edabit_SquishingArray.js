/*
Squishing an Array
https://edabit.com/challenge/8p7apuCwgSzWkaTC8

TIME TAKEN: Around 45:00

Problem:
Write a function that squishes an array from the left or the right.

Input: Array, String indicating left or right
Output: Array

Rules:

Implicit Rules/Questions:
-What is meant by squish?
Squish means to combine the first/last two numbers of the array into one value, leaving the other values alone

-Will there ever be less or more than 2 arguments passed? -> No
-Will the array ever be empty? -> []
-Will the array ever be sparse? -> No
-Will the array always contain integers greater than 0 -> Not always
-Can the array be any size? -> Yes

-Will the input string ever be empty? -> Yes // return original array
-Will the case of left and right always be the same? Do i have to account for uppercase letters or the entire string? -> It will be the same

Examples:
squish([1, 2, 3, 4, 5], "left")
➞ [[1, 2, 3, 4, 5], [3, 3, 4, 5], [6, 4, 5], [10, 5], [15]]

Left:
[1, 2, 3, 4, 5] -> [3, 3, 4, 5] -> [6, 4, 5] -> [10, 5] -> [15]

Right:
[1, 2, 3, 4, 5] -> [1, 2, 3, 9] -> [1, 2, 12] -> [1, 14] -> [15]

console.log(squish([], 'left')); // []
console.log(squish([], 'right')); // []
console.log(squish([1], 'left')); // [[1]]
console.log(squish([1], 'right')); // [[1]]
console.log(squish([1, 2], 'left')); // [[1, 2], [3]]
console.log(squish([1, 2], 'right')); // [[2, 1], [3]]
console.log(squish([-2, -1, 0, 1, 2], 'right')); // [[-2, -1, 0, 1, 2], [-3, 0, 1, 2], [-3, 1, 2], [-2, 2], [0]]
console.log(squish([1, 2, 3, 4, 5], 'left')); // [[1, 2, 3, 4, 5], [3, 3, 4, 5], [6, 4, 5], [10, 5], [15]]
console.log(squish([1, 2, 3, 4, 5], 'right')); // [[1, 2, 3, 4, 5], [1, 2, 3, 9], [1, 2, 12], [1, 14], [15]]

Data Structure:
Arrays

Algorithm:
-Create a results variable pointing to an empty array
-Until the length of results is equal to the length of the input array:
  -Push the input array into results
  -Check if direction is "right" if it is, reverse the array
  -sum the array values at 0 and 1 index, combined with the rest of the array (index 1 to the end)

  -Check if direction is "right", if it is, reverse the array again
  -Reassign input array to the result
-Return the results array
*/

function squish(arr, direction) {
  let arrLength = arr.length;
  let results = [];
  while (results.length < arrLength) {
    results.push(arr.slice());
    if (direction === 'right') arr.reverse();
    // let sum = arr[0] + arr[1];
    let newArr = [arr.shift() + arr.shift()].concat(arr.slice());
    if (direction === 'right') newArr.reverse();
    arr = newArr;
  }

  return results;
}

console.log(squish([], 'left')); // []
console.log(squish([], 'right')); // []
console.log(squish([1], 'left')); // [[1]]
console.log(squish([1], 'right')); // [[1]]
console.log(squish([1, 2], 'left')); // [[1, 2], [3]]
console.log(squish([1, 2], 'right')); // [[1, 2], [3]]
//console.log(squish([-2, -1, 0, 1, 2], 'left')); // [[-2, -1, 0, 1, 2], [-3, 0, 1, 2], [-3, 1, 2], [-2, 2], [0]]
// console.log(squish([1, 2, 3, 4, 5], 'left')); // [[1, 2, 3, 4, 5], [3, 3, 4, 5], [6, 4, 5], [10, 5], [15]]
// console.log(squish([1, 2, 3, 4, 5], 'right')); // [[1, 2, 3, 4, 5], [1, 2, 3, 9], [1, 2, 12], [1, 14], [15]]
console.log(squish([1, 2, 3, 4, 5], "right"))//, [[1, 2, 3, 4, 5], [1, 2, 3, 9], [1, 2, 12], [1, 14], [15]])
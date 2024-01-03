/*
Diamond Shaped Array
https://edabit.com/challenge/BPjwuov9iAA6gosGH
TIME TAKEN: 23:00

Create a function that returns an array that expands by 1 from 1 to the value of the input, and then reduces back to 1. Items in the arrays will be the same as the length of the arrays.

Problem:
Input: Integer
Output: Array of arrays

Rules:
-Create sub arrays that start at 1 to the input value and reduce back to 1
-Each sub array should be filled with the same number as the length of the sub array

Implicit Rules/Questions:
-Will the input always be an integer?
  -Will the input always be greater than 0? -> Could be 0 -> []

Examples:
diamondArrays(0) // []
diamondArrays(1) // [[1]]
diamondArrays(2) // [[1], [2, 2], [1]]
diamondArrays(3) // [[1], [2, 2], [3, 3, 3], [2, 2], [1]]

Data Structure:
Arrays - iteration to build subarrays

Algorithm:
-Create a results variable (empty array)
-Iterate from 1 up to but not including the input number // 1, 2
-On each iteration:
  -Create a temp variable (empty array)
  -Fill the temp array with values of the current iteration // 1
    -Until the temp array length is equal to the current iteration // [1]
  -Push the temp array to results array [[1], [2, 2]]

-Push an array to the results array filled with values of the input number until the length is equal to the input number. [[1], [2, 2], [3, 3, 3]]

-Slice the results array from the first (0) index up to the input number minus 2 // [[1], [2, 2]]
  -Reverse it // [[2, 2], [1]]
  -Iterate through the reversed array and push each value (subarray) to the results array

-Return the results array
*/

// function fillArray(num) {
//   let result = [];
//   while (result.length < num) {
//     result.push(num);
//   }

//   return result;
// }

function diamondArrays(num) {
  let lowToHigh = [];
  for (let idx = 1; idx <= num; idx += 1) {
    lowToHigh.push(new Array(idx).fill(idx))
    // lowToHigh.push(fillArray(idx));
  }

  let highToLow = lowToHigh.slice(0, num - 1).reverse();
  return lowToHigh.concat(highToLow);
}

console.log(diamondArrays(0)) // []
console.log(diamondArrays(1)) // [[1]]
console.log(diamondArrays(2)) // [[1], [2, 2], [1]]
console.log(diamondArrays(3)) // [[1], [2, 2], [3, 3, 3], [2, 2], [1]]
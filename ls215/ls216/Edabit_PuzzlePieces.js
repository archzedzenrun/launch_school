/*
https://edabit.com/challenge/Zu4LyLXhd9e49krFP
TIME TAKEN: 13:30

Input: Two Arrays
Output: Boolean

Rules:
-Find the sum of the numbers at the same index in both Arrays
-Return true if all of the sums are the same number
-Each array will have at least 1 element
-Return false if the arrays are different lengths

Implicit Rules/Questions:
-Will the arrays ever include non-integer values?
-Will there ever be more or less arguments than 2?
-Will the number values always be positive integers?

puzzlePieces([1, 2, 3, 4], [4, 3, 2, 1]) // true
puzzlePieces([1, 2, 3, 4], [1, 2, 3, 4]) // false
puzzlePieces([1, 2, 3, 4], [1, 2, 3]) // false

1 + 4 (index 0) = 5
2 + 3 (index 1) = 5
3 + 2 (index 2) = 5
4 + 1 (index 3) = 5

Data Structure:
Array - Iteration/Transformation

Algorithm:
-Return false if the input arrays are different sizes
-Iterate through the first array
  -Find the sum of the current value and the value at the current index in the second array

-Check if every sum in the array is equal to the first value in the array
-Return true/false
*/

function puzzlePieces(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;

  let sums = arr1.map((num, idx) => num + arr2[idx]);
  return sums.every(num => num === sums[0]);
}

console.log(puzzlePieces([1, 2, 3, 4], [4, 3, 2, 1])) // true
console.log(puzzlePieces([1, 2, 3, 4], [1, 2, 3, 4])) // false
console.log(puzzlePieces([1, 2, 3, 4], [1, 2, 3])) // false
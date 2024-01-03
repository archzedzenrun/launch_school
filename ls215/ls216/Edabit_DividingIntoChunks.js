/*
https://edabit.com/challenge/RaxaX4wmKKCsrzKwJ
TIME TAKEN: 28:00

Write a function that divides an array into chunks such that the sum of each chunk is <= n. Start from the left side of the array and move to the right.

Input: Array of integers, integer
Output: Array of arrays

Rules:
-Each sum should be less than or equal to the second argument


Questions:
Will there be less or more than 2 arguments passed? -> No
Will the first arg always be an array? -> Yes
Can the array be any length? -> Yes
Can the array be empty? -> Yes
Will the array only contain whole numbers? Negative, 0 or positive numbers

Will the second arg always be an integer? -> Yes
Will it always be positive? -> Not always
Are numbers reused or it starts at the next number after the last chunk?

Examples:
[[1, 2]]
[] -> [1] -> [1, 2] -> [] -> [3]
divide([1, 2, 3, 4, 5], 4) // [[1, 2], [3], [4]]
divide([3, 1, 0, 5, -2], 3) // [[3], [1, 0], [5, -2]]
divide([2, 3], 2) // [[2]]
divide([2], 4) // []
divide([], 3) // []

Algorithm:
-Create a results variable to an empty array
-Create a chunk variable to an empty array
-Iterate through the input array
  -Check if the sum of all nums in the chunk array is greater than input arg
  -If it is:
    -Push chunk to results array
    -Reset chunk to empty array
    -Push current num to chunk array
  -Otherwise:
    -Push current num to chunk array
-Return results
*/

function sumChunk(chunk) {
  return chunk.reduce((sum, num) => sum + num, 0);
}

function divide(arr, targetSum) {
  let results = [];
  let chunk = [];
  arr.forEach(currentNum => {
    if (sumChunk(chunk) + currentNum > targetSum) {
      results.push(chunk);
      chunk = [];
      chunk.push(currentNum);
    } else {
      chunk.push(currentNum);
    }
  })

  if (sumChunk(chunk) <= targetSum) {
    results.push(chunk)
  }

  return results;
}

console.log(divide([1, 2, 3, 4, 5], 4)); // [[1, 2], [3], [4]]
console.log(divide([3, 1, 0, 5, -2], 3)); // [[3], [1, 0], [5, -2]]
console.log(divide([2, 3], 2)); // [[2]]
console.log(divide([2], 4)); // []
console.log(divide([], 3)); // []

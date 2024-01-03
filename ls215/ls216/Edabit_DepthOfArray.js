// https://edabit.com/challenge/JJtafXGmNegpQMp6p

// Given an array, write a function to calculate it's depth. Assume that a normal array has a depth of 1.

/*
Problem:
Input: Array
Output: Integer

Rules:
-Find the depth of the input array

Implicit Rules/Questions:
-Will there ever be less or more than 1 arguments passed? -> No
-Empty array -> 1
-Do arrays nested in objects count toward the depth? -> No
-Arrays could be sparse
-Do multiple arrays at the same level count towards the depth? -> No

Data Structure:
Array

Algorithm:
-Create a count variable (0)
-Iterate through the input array
-On each iteration:
  -Check if current element is an array
    -If it is, increment count by 1 and flatten the current array
-Return count
*/

// function depth(arr) {
//   let count = 1;

//   while (arr.some(ele => Array.isArray(ele))) {

//   // arr.forEach(ele => {
//   //   if (Array.isArray(ele)) {
//       count += 1;
//       arr = arr.flat();
//     }
//   // })
//   // }
//   return count;

// }
// function depth(arr) {
//   return Array.isArray(arr) ? 1 + Math.max(...arr.map(depth)) : 0;
// }


function depth(arr, count) {
  let depthCount = count || 1;
  arr.forEach(ele => {
    if (Array.isArray(ele)) {
      depthCount += 1;
      arr.flat();
    }
  })
}

console.log(depth([])); // 1
console.log(depth([1, ,[]])); // 2
console.log(depth([1, { arr: [] }])); // 1
console.log(depth([1, [2, [3, 4]]])); // ➞ 3
console.log(depth([1, [2], [3, 4]])); // ➞ 2
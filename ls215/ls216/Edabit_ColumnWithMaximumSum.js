/*
Column With Maximum Sum
https://edabit.com/challenge/X47SKhYan6mATPfhA

TIME TAKEN 35:00

Input: Array containing numbers
       Integer representing split group size

Output: Integer

Rules:
-The array input will always divide into equal group lengths
-Split the array into n sized groups
-Imagine these groups are stacked on top of each other, creating columns.
-Find the column number with the greatest sum.

Implicit Rules/Questions:
Will the array ever be empty?
Will the array ever contain data types other than integers?
Will the numbers in the array always be posive integers? (greater than 0?)
Will the nums argument ever be a data type other than array?

Will there ever be less or more than 2 arguments passed?

Will n always be an integer?
Will n always be a positive integer?

Smallest column number means the "column" that appears first? Assume yes

Notes:
Columns are each index of the split groups
index 0 - column 1
index 1 - column 2......

Examples:
nums = [4, 14, 12, 7, 14, 16, 5, 13, 7, 16, 11, 19]
n = 4

[4, 14, 12, 7]
[14, 16, 5, 13]
[7, 16, 11, 19]

25, 46, 28, 39

Greatest: 46 at column 2

nums = [1, 2, 3, 4, 5, 6]
n = 3

[1, 2, 3]
[4, 5, 6]
5, 7, 9 = column 3

nums = [1, 1, 1, 1]
n = 2

[1, 1]
[1, 1]
2, 2 - column 1

Data Structure:
Arrays

Algorithm:
Helper function splitGroups:
-Create a groups variable (empty array) to hold the split groups
-Create a group variable to an empty array to hold elements
-Iterate through the input array
  -Push current number to group array until its equal to N argument
  -Push group array into groups array
  -Reset group array to an empty array

Main function:
-Create a sums variable (empty arrray) to hold sums

-Iterate from 0 up to but not including argument N (the index of each num in each group)
-On each iteration:
-Iterate through the groups array
  -Find the value of the outer index in the current group, add it to the sum variable.
-After each group iteration push the value of sum to the sums array

-Find the index of the greatest sum and return the index plus 1
*/

function splitGroups(arr, n) {
  let groups = [];
  let group = [];
  arr.forEach(num => {
    if (group.length === n) {
      groups.push(group);
      group = [];
    }

    group.push(num);
  })

  groups.push(group);
  return groups;
}

function columnMaxSum(arr, n) {
  if (arr.length === 0) return [];
  if (n < 1) return undefined;

  let groups = splitGroups(arr, n);
  let sums = [];

  for (let col_idx = 0; col_idx < n; col_idx += 1) {
    let sum = 0;
    groups.forEach(group => {
      sum += group[col_idx];
    })

    sums.push(sum);
  }

  return sums.indexOf(Math.max(...sums)) + 1;
}

console.log(columnMaxSum([4, 14, 12, 7, 14, 16, 5, 13, 7, 16, 11, 19], 4)); // 2
console.log(columnMaxSum([1, 2, 3, 4, 5, 6], 3)); // 3
console.log(columnMaxSum([], 2)); // []
console.log(columnMaxSum([1, 2, 3], -1)) // undefined
console.log(columnMaxSum([1, 1, 1, 1], 2)); // 1
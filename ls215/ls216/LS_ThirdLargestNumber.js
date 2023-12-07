/*
Given an array of integers, nums, return the third largest number in the array. If the third largest number does not exist, return the greatest number.

You are not allowed to sort the array.

Input: Array of integers
Output: Integer

Rules:
-Find and return the third largest number in the array
-Return the greater number if there is no third largest number

Questions/Implicit Rules:
-Largest means largest numeric value
-Will the input always contain only integers?
-Will the input ever be empty? -> return empty array
-WIll there ever be more or less arguments passed?

thirdMax([1, 4, 2, 7, 5])

[1, 4, 2, 7, 5]
[4, 7, 5]


thirdMax([3, 2, 1])

Data Structure:
Array - iteration

thirdMax([1, 4, 4, 7, 5])
[4, 7, 5]

Algorithm:
-Iterate through the input array
-Filter out any numbers less than or equal to the current number until the size of the array is 3

-Create a variable to hold an initial value (first number in the filtered array)
-Iterate through the filtered array starting at the second number
  -Compare the numeric value of current num with the stored num
  -If its less than the stored num, set stored num to current num

-Return stored num
*/

function thirdMax(arr) {
  while (arr.length > 3) {
    arr.splice(arr.indexOf(Math.min(...arr)), 1)
  }

  return Math.min(...arr);

  // let arrCopy = arr.slice(0);
  // for (let i = 0; i < arr.length; i += 1) {
  //   if (arrCopy.length === 3) break;
  //   let currentNum = arr[i];
  //   arrCopy = arrCopy.filter(num => num >= currentNum)
  // }

  // let result = arrCopy[0]
  // arrCopy.slice(1).forEach(num => {
  //   if (num < result) {
  //     result = num;
  //   }
  // })

  // return result;
}

console.log(thirdMax([3, 2, 1])); // 1
console.log(thirdMax([1, 4, 2, 7, 5])) // 4
console.log(thirdMax([1, 4, 2, 7, 5, 2, 3, 8, 8, 6]))
console.log(thirdMax([2, 3])) // 3
console.log(thirdMax([2])) // 2
console.log(thirdMax([])) // []
console.log(thirdMax([5, 7, 2, 4, 1])) // 4

// Can the array have repeated numbers, e.g., [3, 3, 1]? If so, how should I handle those? Should I handle the two 3s as different numbers and return 1, or should I return the largest number, 3?​
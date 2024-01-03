/*
https://edabit.com/challenge/jN89tuARCFbtQm6vE
TIME TAKEN 1:00

Write a function that returns true if a string consists of ascending or ascending AND consecutive numbers.

ascending("232425") ➞ true
// Consecutive numbers 23, 24, 25

ascending("2324256") ➞ false
// No matter how this string is divided, the numbers are not consecutive.

ascending("444445") ➞ true
// Consecutive numbers 444 and 445.

Test.assertEquals(ascending("1234567"), true)
Test.assertEquals(ascending("123412351236"), true)
Test.assertEquals(ascending("1235"), false)
Test.assertEquals(ascending("121316"), false)
Test.assertEquals(ascending("12131213"), false)

Notes
A number can consist of any number of digits, so long as the numbers are adjacent to each other, and the string has at least two of them.

Problem:

Input:
Output:

Rules:
-Check if a string contains asending numbers or ascending and consecutive numbers
-String can be any size
-String must have at least 2 numbers
-Numbers will be adjascent to each other
-Empty string returns false

Questions:
-

ascending("232425")
[2, 3, 2, 4, 2, 5] -> [2, 2, 2, 3, 4, 5]
[23, 24, 25] -> [23, 24, 25]
[232, 425]

Algorithm:
Helper function
-Input: Integer (size of groups), array
-Create a results array
-Create a group array
-Iterate through the input array
  -Push number to group array
  -Push group array to results array if its length is equal to the input
-Return results

Helper function check consecutive:
-Input: array of numbers
-Create a variable with the first value of the array
-Iterate through the input array
  -Check if current number is greater than the value of firstValue
  -If it is, reassign firstValue to current number
  -Otherwise return false
-Return true

-Create a loop from 1 up to the string length
-Use helper function to group numbers by size based on current iteration number
-Sort the grouped numbers numerically in ascending order
-Check if the sorted numbers are the same as the original grouped numbers or if the numbers in the sorted array are consecutive

*/

function groupArray(size, array) {
  let results = [];
  let group = [];

  array.forEach(num => {
    group.push(num);
    if (group.length === size) {
      results.push(Number(group.join('')));
      group = [];
    }
  })

  if (group.length !== 0) {
    results.push(Number(group.join('')));
  }

  return results;
}

function equalArrays(arr1, arr2) {
  for (let i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) {
      return false;
    }
  }

  return true;
}

function consecutiveArray(array) {
  let initialValue = array[0];
  for (let i = 1; i < array.length; i += 1) {
    if (array[i] === initialValue + 1) {
      initialValue = array[i];
    } else {
      return false;
    }
  }

  return true;
}

function ascending(string) {
  let numbers = [...string].map(Number);

  for (let groupSize = 1; groupSize <= string.length / 2; groupSize += 1) {
    let groupedNums = groupArray(groupSize, numbers)
    let sortedGroup = groupedNums.slice().sort((num1, num2) => num1 - num2);
    if (consecutiveArray(sortedGroup) && equalArrays(groupedNums, sortedGroup)) {
      return true;
    }
  }

  return false;
}

// console.log(ascending("232425")); // true)
// console.log(ascending("444445")); // true)
// console.log(ascending("1234567")); // true)
// console.log(ascending("123412351236")); // true)
// console.log(ascending("57585960616263")); // true)
// console.log(ascending("500001500002500003")); // true)
// console.log(ascending("919920921")); // true)


// console.log(ascending("1235")); // false)
// console.log(ascending("121316")); // false)
// console.log(ascending("12131213")); // false)

// console.log(ascending("2324256")); // false)
// console.log(ascending("54321")); // false)
// console.log(ascending("56555453")); // false)
// console.log(ascending("90090190290")); // false)


// console.log(ascending("35236237238")); // false)
// ascending("232425")
// console.log(ascending("1234567")); // true)
// console.log(ascending("123412351236")); // true)


// console.log(ascending("1235")); // false)
// console.log(ascending("121316")); // false)
// console.log(ascending("12131213")); // false)
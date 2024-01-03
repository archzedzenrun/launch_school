/*
https://edabit.com/challenge/biyHa34iTd58LfFFb
TIME TAKEN: 22:00

The mode of a group of numbers is the value (or values) that occur most often (values have to occur more than once). Given a sorted array of numbers, return an array of all modes in ascending order. There will be at least one mode.

Input: Array of sorted numbers
Output: Array of modes in ascending order (smallest to largest)

Rules:
-Return an array with the modes in the array
-Mode is a number or numbers that occur the most often
  -They have to occur more than once

-There will be at least one mode
-Since values have to appear more than once to be a mode, and there will be at least one mode, the input array will always have at least 2 of the same number

Questions:
-Will there ever be less or more than 1 arguments passed? -> No
-Will the argumnet always be an array? -> Yes
-Will the array ever be empty? -> No
-Will the array only contain numbers? -> Yes
-No other values like NaN/null/boolean, etc? -> No
-Will the numbers always be greater than 0? -> Yes
-WIll there be negative numbers? -> No

Examples:
console.log(mode([])) // []
console.log(mode([2, 2])) // [2]
console.log(mode([3, 3, 3, 2, 2, 4, 4, 4])) // [3, 4]
console.log(mode([2, 2, 1, 1, 3, 3, 5])) // [1, 2, 3]
console.log(mode([2, 2, 2, 2, 3, 3, 1])) // [2]

Data Structure:
Array for iteration
Object to store number counts

Algorithm:
-Create a results variable to an empty array

-Create a counts variable to an empty object
-Iterate through the input array
  -Check if current number exists as a property in counts
    -If it does: increment its value by 1
    -Otherwise set its value to 1

-Find the largest count value in the counts object
-Iterate through the entries of the count object, add the number to results if the count is equal to the largest count

-Return results
*/

function counts(array) {
  return array.reduce((counts, num) => {
    counts[num] ? counts[num] += 1 : counts[num] = 1;
    return counts;
  }, {})
}

function mode(array) {
  let results = [];
  let numCounts = counts(array);
  let largestCount = Math.max(...Object.values(numCounts));
  Object.entries(numCounts).forEach(entry => {
    if (entry[1] === largestCount) {
      results.push(Number(entry[0]));
    }
  })

  return results
}

console.log(mode([2, 2])) // [2]
console.log(mode([3, 3, 3, 2, 2, 4, 4, 4])) // [3, 4]
console.log(mode([2, 2, 1, 1, 3, 3, 5])) // [1, 2, 3]
console.log(mode([2, 2, 2, 2, 3, 3, 1])) // [2]

console.log(mode([1, 2, 3, 3, 6, 7, 8, 9])); // [3])
console.log(mode([2, 3, 3, 4, 4, 6, 7, 8])); // [3, 4])
console.log(mode([1, 6, 6, 7, 7, 8, 9])); // [6, 7])
console.log(mode([4, 4, 4, 6, 8, 9, 10, 10])); // [4])
console.log(mode([1, 4, 6, 7, 9, 9])); // [9])
console.log(mode([2, 2, 2, 3, 7, 8, 9, 9])); // [2])
console.log(mode([2, 4, 5, 5, 7, 8, 10, 10])); // [5, 10])
console.log(mode([1, 1, 4, 4, 5, 7, 9])); // [1, 4])
console.log(mode([2, 3, 3, 3, 4, 7, 9])); // [3])
console.log(mode([1, 1, 2, 4, 4, 6, 6, 9])); // [1, 4, 6])
console.log(mode([1, 2, 3, 3, 3, 7, 9, 10])); // [3])
console.log(mode([1, 2, 5, 6, 6, 6, 7, 10])); // [6])
console.log(mode([2, 2, 6, 9, 10, 10, 10])); // [10])
console.log(mode([1, 1, 5, 6, 6, 10, 10])); // [1, 6, 10])
console.log(mode([2, 2, 3, 3, 4, 8])); // [2, 3])
console.log(mode([2, 3, 8, 10, 10, 10, 10])); // [10])
console.log(mode([2, 2, 3, 4, 6, 9])); // [2])
console.log(mode([1, 2, 5, 8, 9, 9, 10, 10])); // [9, 10])
console.log(mode([2, 3, 3, 4, 4, 5])); // [3, 4])
console.log(mode([2, 2, 3, 3, 4, 5, 10, 10])); // [2, 3, 10])
console.log(mode([1, 3, 3, 5, 5, 9, 10, 10])); // [3, 5, 10])
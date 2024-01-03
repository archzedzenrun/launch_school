/*
https://edabit.com/challenge/XWXprtaTWYCWBGAax
TIME TAKEN: 14:00

Given an array, create a function that returns an object detailing how many times each element was repeated. Sort the object by value in descending order.

Input: array
Output: object

Rules:
-Create an object with the counts of each element in the input array
-Sort the object by value in descending order (greatest to smallest)
-Empty input returns {}

Quesions:
-Less/more than 1 arg? -> No
-Input always array? -> Yes
-Array ever empty? -> Maybe
-Can the elements in array be any type? -> Yes

Data Structure:
Array - iteration

Algorithm:
-Create a results var to empty object
-Iterate through the input array
  -Check if current element exists as a key in results
  -If it does increment value by 1
  -otherwise set property value to 1
-Sort result entries by value
-Return as object
*/

function countRepetitions(array) {
  let results = {};
  array.forEach(element => {
    if (results[element]) {
      results[element] += 1;
    } else {
      results[element] = 1;
    }
  })

  let sorted = Object.entries(results).sort((ele1, ele2) => {
    if (ele2[1] - ele1[1] !== 0) {
      return ele2[1] - ele1[1];
    } else {
      return ele1[0].localeCompare(ele2[0]);
    }
  });
  return Object.fromEntries(sorted);
}

console.log(countRepetitions(["cow", "cat",  "cat", "cow", "cow", "cow", "cat"])); // ➞ { cow: 3, cat: 2, dog: 1 }

console.log(countRepetitions([1, 5, 5, 5, 12, 12, 0, 0, 0, 0, 0, 0])); // ➞ { 0: 6, 5: 3, 12: 2, 1: 1 }

console.log(countRepetitions(["Infinity", "null", "Infinity", "null", "null"])); // ➞ { null: 3, Infinity: 2}
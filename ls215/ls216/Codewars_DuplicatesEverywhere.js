/*
https://www.codewars.com/kata/5e8dd197c122f6001a8637ca/solutions?filter=all&sort=best_practice&invalids=false

TIME TAKEN: 1:00

You are given a table, in which every key is a stringified number, and each
corresponding value is an array of characters, e.g.

Input: Object
Output: Object

Rules:
-

Questions:
-Less/more than 1 arg? -> No
-Empty object? -> No
-Arg always object? -> Yes
-Value always array? -> Yes
-Array only contain alpha chars -> Yes

{
  "1": ["A", "B", "C"],
  "2": ["A", "B", "D", "A"],
}
Create a function that returns a table with the same keys, but each
character should appear only once among the value-arrays, e.g.

Rules
Whenever two keys share the same character, they should be compared numerically,
and the larger key will keep that character. That's why in the example above the
array under the key "2" contains "A" and "B", as 2 > 1.
If duplicate characters are found in the same array, the first occurance should be kept.

{
  "1": ["C"],
  "2": ["A", "B", "D"],
}

Example 1
input = {
  "1": ["C", "F", "G"],
  "2": ["A", "B", "C"],
  "3": ["A", "B", "D"],
}

output = {
  "1": ["F", "G"],
  "2": ["C"],
  "3": ["A", "B", "D"],
}

results = [["A", "B", "D"], ["C"], ["F", "G"]]

[
  [ 'A', 'B', 'D' ],
  [ 'A', 'B', 'C' ],
  [ 'C', 'F', 'G' ]
]

Notes:
Start at largest key
Iterate through every key
  Iterate through every value in array
    Delete current value from every other array

Each subarray should be filtered array

Algorithm:
-Create results array

-Turn input into array of subarrays and reverse them
-Iterate through reversed array
  -push current array with duplicates removed to results if its index 0

  -Iterate through the chars of the last array in results
    -Filter current char out of current array
    -Push filtered array to results
*/

function filterArray(lastEntry, array) {
  lastEntry.forEach(char => {
    array = array.filter(ele => ele !== char);
  })

  return array;
}

function uniqueTable(table) {
  let tableValues = Object.values(table).reverse()
  let results = [Array.from(new Set(tableValues[0]))]
  tableValues.slice(1).forEach(array => {
    let lastEntry = results[results.length - 1]
    results.push(filterArray(lastEntry, array));
  })

  results = results.reverse()
  Object.entries(table).forEach((entry, idx) => table[entry[0]] = results[idx])
  return table;
}


console.log(uniqueTable({
  "1": ["C", "F", "G"],
  "2": ["A", "B", "C"],
  "3": ["A", "B", "D"],
}));

console.log(uniqueTable({
  "1": ["A", "B", "C"],
  "2": ["A", "B", "D", "A"],
}));

console.log(uniqueTable({ "1": [], "2": [], "3": ["A"] }));

// TRISH

// function strangeObj(obj) {
//   let result = {};
//   let entries = Object.entries(obj);
//   let nextEntryVal;

//   for (let idx = 0; idx < entries.length - 1; idx ++) {
//     let sharedLetters =[];
//     let currEntry = entries[idx];
//     nextEntryVal = entries[idx + 1][1];

//     currEntry[1].forEach(char => {
//       if (nextEntryVal.includes(char)) sharedLetters.push(char);
//     })

//     let newValues = currEntry[1].filter(char => !sharedLetters.includes(char));
//     result[currEntry[0]] = newValues;
//   }

//   result[entries[entries.length - 1][0]] = entries[entries.length - 1][1];
//   return result;
// }
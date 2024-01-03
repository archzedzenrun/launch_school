/*
https://edabit.com/challenge/socoDGxk3JGKezRYm
TIME TAKEN: 28:00

Write a function that groups words by the number of capital letters and returns an array of object entries whose keys are the number of capital letters and the values are the groups.

Input: Array of strings
Output: Array of sub arrays, subarrays are object entries

Rules:
-Grouping words by the numbe rof capital letters in an object
-Properties are the count of capital letters, value is the group of words

Questions:
-Less/more than 1 arg? -> No
-Arg always array? -> Yes
-Will input array be empty? -> No
-Can array be any size? -> Yes
-Array will only contain strings? -> Yes
-Strings contain other chars? -> No
-Are entries sorted by count in output? -> Yes

grouping(["HaPPy", "mOOdy", "yummy", "mayBE"]) ➞ [
  [0, ["yummy"]],
  [2, ["mayBE", "mOOdy"]],
  [3, ["HaPPy"]]
]

grouping(["Hello"]) // [[1, ["Hello"]]]
grouping(["Happy", "BiRtHday"]) // [[1, ["Happy"], [3, ["BiRtHday"]]]]

Data Structure:
-Object to hold counts of words

Algorithm:
-Create a results variable to an empty array
-Create a counts variable to an empty object
-Iterate through the input array
  -Find the count of uppercase letters
  -Check if the count exists in counts object
  -If it does, push the current word to the value of the count
  -Otherwise:
    -Set the count as a property in the counts object and set the value to an array with the current word in it.
-Iterate through the entries of the counts object, sort the values and push the entry to results
-Return results
*/

function grouping(arr) {
  let counts = {};
  arr.forEach(word => {
    let uppercaseCount = word.match(/[A-Z]/g)
    uppercaseCount = !uppercaseCount ? 0 : uppercaseCount.length
    if (counts[uppercaseCount]) {
      counts[uppercaseCount].push(word);
    } else {
      counts[uppercaseCount] = [word];
    }
  })

  Object.entries(counts).forEach(entry => {
    entry[1].sort((word1, word2) => word1.toLowerCase().localeCompare(word2.toLowerCase()))
  })

  return Object.entries(counts);
}

console.log(grouping(["HaPPy", "mOOdy", "yummy", "mayBE"])) //➞ [
//   [0, ["yummy"]],
//   [2, ["mayBE", "mOOdy"]],
//   [3, ["HaPPy"]]
// ]

// grouping(["Hello"]) // [[1, ["Hello"]]]
// grouping(["Happy", "BiRtHday"]) // [[1, ["Happy"], [3, ["BiRtHday"]]]]


// console.log(grouping(["MOVIE", "TAKE", "PERSON"])); // [
//   // [4, ["TAKE"]],
//   // [5, ["MOVIE"]],
//   // [6, ["PERSON"]]


// console.log(grouping(["the", "them", "theme", "EVERY"])); // [
//   // [0, ["the", "them", "theme"]],
//   // [5, ["EVERY"]]

// console.log(grouping(["HaPPy", "mOOdy", "yummy", "mayBE"])); // [
// //   [0, ["yummy"]],
// //   [2, ["mayBE", "mOOdy"]],
// //   [3, ["HaPPy"]]
// // ])

// console.log(grouping(["eeny", "meeny", "miny", "moe"])); // [
// //   [0, ["eeny", "meeny", "miny", "moe"]]
// // ])

// console.log(grouping(["FORe", "MoR", "bOR", "tOR", "sOr", "lor"])); // [
// //   [0, ["lor"]],
// //   [1, ["sOr"]],
// //   [2, ["bOR", "MoR", "tOR"]],
// //   [3, ["FORe"]]
// // ])


/*
Abbreviations Unique
https://edabit.com/challenge/H8JABWQfYFN4ZSAxE
TIME TAKEN: 50:00 ***FAIL***
-lack of method knowledge (startsWith)
-problem not totally clear

You are given two inputs:

    An array of abbreviations.
    An array of words.

Write a function that returns true if each abbreviation uniquely identifies a word, and false otherwise.

Problem:
Input: 2 Arrays
Output: Boolean

Notes:
-All words in the array of words must be associated with 1 abbreviation
-Each abbreviation can only identify 1 word, if it can be used to identify more than 1 word, return false

Rules:
-Return true if all of the words are uniquely identified by abbreviations
-Otherwise return false
-The size of the arrays must be equal -> false

Implicit Rules/Questions:
-Will abbreviations ever be empty? -> Could be
-Will the words array ever be empty? -> Could be
-Will there ever be less or more than 2 arguments passed to the function? -> No
-Will both inputs always be arrays? -> Maybe not -> "Invalid input"
-Will both arrays always contain string types? -> Yes
-Are the words and abbreviations case sensitive? - Yes

Examples:
uniqueAbbrev([], 'hi') // "Invalid input"
uniqueAbbrev('hi', []) // "Invalid input"
uniqueAbbrev(['ho', 'h'], []) // false
uniqueAbbrev([], ['house', 'hope']) // false
uniqueAbbrev(['hou'], ['house', 'hope']) // false
uniqueAbbrev(["ho", "h", "ha"], ["house", "hope", "happy"]) // false
uniqueAbbrev(['he', 'ho', 's'], ['hello', 'house', 'school'] // true
uniqueAbbrev(['he', 'ho', 's'], ['Hello', 'house', 'school'] // false

Data Structure:
Arrays - Iteration

Algorithm:
-Iterate through the abbreviations array
-On each iteration:
  -Iterate through the words array
  -On each iteration:
    -Check if the current abbreviation matches the current word
    -If it does, delete the current word from the words array and stop iterating
-Check the length of the words array
  -If its equal to 0 return true
  -Otherwise return false
*/

// function uniqueAbbrev(abbreviations, words) {
//   if (abbreviations.length === 0 || words.length === 0) {
//     return false;
//   }

//   abbreviations.forEach(abbreviation => {
//     for (let idx = 0; idx < words.length; idx += 1) {
//       let regex = new RegExp(`^${abbreviation}`)
//       // console.log(regex, words)
//       if (regex.test(words[idx])) {
//         words.splice(idx, 1);
//         break;
//       }
//     }
//   })

//   return words.length === 0;
// }

function uniqueAbbrev(abbreviations, words) {
  let count = 0;
  abbreviations.forEach(abbreviation => {
    for (let i = 0; i < words.length; i += 1) {
      if (words[i].startsWith(abbreviation)) {
        count += 1;
      }
    }
  })

  return count === 3;
}

// console.log(uniqueAbbrev([], 'hi')) // false
// console.log(uniqueAbbrev('hi', [])) // false
// console.log(uniqueAbbrev(['ho', 'h'], [])) // false
// console.log(uniqueAbbrev([], ['house', 'hope'])) // false
// console.log(uniqueAbbrev(['hou'], ['house', 'hope'])) // false
console.log(uniqueAbbrev(["ho", "h", "ha"], ["house", "hope", "happy"])) // false
// console.log(uniqueAbbrev(['he', 'ho', 's'], ['hello', 'house', 'school'])) // true
// console.log(uniqueAbbrev(['he', 'ho', 's'], ['Hello', 'house', 'school'])) // false

// console.log(uniqueAbbrev(["s", "t", "v"], ["stamina", "television", "vindaloo"]) === true)
// console.log(uniqueAbbrev(["mo", "ma", "me"], ["moment", "many", "mean"]) === true)
// console.log(uniqueAbbrev(["at", "o", "abe"], ["atom", "original", "abet"]) === true)
// console.log(uniqueAbbrev(["rh", "par", "re"], ["rhino", "parry", "residue"]) === true)
// console.log(uniqueAbbrev(["ho", "h", "ha"], ["house", "hope", "happy"]) === false)
// console.log(uniqueAbbrev(["bi", "ba", "bat"], ["big", "bard", "battery"]) === false)
// console.log(uniqueAbbrev(["b", "c", "ch"], ["broth", "chap", "cardigan"]) === false)
// console.log(uniqueAbbrev(["to", "too", "t"], ["topology", "took", "torrent"]) === false)
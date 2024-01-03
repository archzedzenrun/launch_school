/*
https://edabit.com/challenge/D4KLn64XNGdrxR63Z
TIME TAKEN 34:00

Write a function that returns true if all the strings in an array can be formed by using only the characters from the longest string.

Input: Array of strings
Output: Boolean

Rules:
-Return true if all strings can be formed using the chars from the longest string

-Only 1 argument will be passed
-Will always be an array
-Will always contain strings
-Strings will have alphabetic letters
-Strings will be lowercase
-Input could be empty

-If a character repeats, there must be an equal amount of that char in the longest string


Questions:
-Will the input array ever be empty?
-

canForm([]) // false
canForm(["mast"]) // true
canForm(["mast", "met"]) // false
canForm(["maast", "manifest"]) // false
canForm(["mast", "manifest", "met", "fan"]) ➞ true

Data Structure:
Arrays

Algorithm:
-Find the longest string in the input array
  -Sort the strings by length descending order
-Iterate from the second string to the last
  -Check if the count of each char in the word is equal to the count in the longest string
-Return true if this is true for all strings
-Otherwise return false
*/

function charCount(char, word) {
  // let count = 0;
  // [...word].forEach(wordChar => {
  //   if (wordChar === char) {
  //     count += 1;
  //   }
  // })
  return [...word].filter(ele => char === ele).length

  // return count;
}

// console.log(charCount('a', 'maast'))
// console.log(charCount('a', 'manifest'))

function canForm(array) {
  if (array.length === 0) return false;
  array.sort((word1, word2) => word2.length - word1.length)
  let longestString = array[0];

  return array.slice(1).every(word => {
    return word.split('').every(char => {
      return charCount(char, word) <= charCount(char, longestString)
    })
  })
}

console.log(canForm([])); // false
console.log(canForm(["mast"])); // true
console.log(canForm(["mast", "met"])); // false
console.log(canForm(["maast", "manifest"])); // false
console.log(canForm(["mast", "maanifest"])); // true
console.log(canForm(["mast", "manifest", "met", "fan"])) //➞ true

// Greg's Solution

// function canForm(arrOfWords) {
//   if (arrOfWords.length === 0) return false;
//   let longestWord = "";
//   arrOfWords.forEach((word) => {
//     if (word.length > longestWord.length) longestWord = word;
//   })
//   const lettersOfLongest = longestWord.split('').reduce((obj, letter) => {
//     obj[letter] = obj[letter] + 1 || 1;
//     return obj;
//   }, {});
//   for (let ind = 0; ind < arrOfWords.length; ind += 1){

//     let currentWordCount = arrOfWords[ind].split('').reduce((obj, letter) => {
//                       obj[letter] = obj[letter] + 1 || 1;
//                       return obj;
//                     }, {});
//     let currentWordLetters = Object.keys(currentWordCount);
//     if(!currentWordLetters.every((letter) => Object.hasOwn(lettersOfLongest, letter))) return false;
//     for (let index = 0; index <= currentWordLetters.length; index += 1) {
//       if ((currentWordCount[currentWordLetters[index]] > lettersOfLongest[currentWordLetters[index]])) return false;
//     }
//   }
//   return true;
// }
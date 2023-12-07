/*
Input: String
Output: String with alpha chars and numeric chars swapped

Rules:
-Swap the positions of numeric and alpha chars

Implicit Rules/Questions:
-The count of alpha chars will not always be equal to the count of numeric chars
-Will the input string contain any other special chars? If so how do i handle those?
-Will the input string ever contain no alpha chars or no numeric chars?
-Will the input string ever be empty?
-Will there ever be less or more arguments passed to the function?
-The input string will be downcased chars?

Examples:
console.log(swap("1a2b3c") === "a1b2c3"); // true
1 <-> a "a12b3c"


console.log(swap("abcd123") === "123dabc"); // true
abcd
123

a <-> 1 "1bcda23"
b <-> 2 "12cdab3"
c <-> 3 "123dabc"

Look through the string until you find a numeric string char

When one is found, start back at the beginning of the string and look for the
first alphabetic string char

Swap those two chars

Data Structure:
Array to hold string chars

Algorithm:
-Create a new array to hold swapped chars
-Split the input string into an array of chars // [1, a, 2, b, 3, c] and transform each char into a sub array with its index

-Iterate through the array
  -Check if current char is numeric 0-9 [1, 0] -> [1, 1]
  -If its not, continue iterating

  -If it is iterate through the array again
    -Check if current char is alpha char [a, 1] -> [a, 0]
    -If its not, keep on iterating
    -If it is , Swap the index values of the current numeric number in the outer iteration and the current alpha char in the inner iteration

    -After the swap, add the numeric and alpha arrays to the new array and delete the values at those indexes from the array of chars


    123
    abc
*/

// ================================FAIL========================================

// function swap(str) {
//   let swappedChars = [];
//   let chars = str.split('').map((char, idx) => [char, idx]);

//   for (let outerIdx = 0; outerIdx < str.length; outerIdx += 1) {
//     if (/[0-9]/.test(chars[outerIdx][0])) {
//       let numericChar = chars[outerIdx[0]];
//       for (let innerIdx = 0; innerIdx < str.length; innerIdx += 1) {
//         if (/[a-z]/i.test(chars[innerIdx][0])) {
//           console.log(numericChar)
//         }
//       }
//     }
//   }
// }

// console.log(swap("1a2b3c")) //=== "a1b2c3"); // true

/*
console.log(swap("1a2b3c") === "a1b2c3"); // true
[1, 2, 3]
[a, b, c]

1a2b3c

If current char is numeric 0-9,
replace it with the char at the beginning of the filtered alpha char array
remove first char from alpha char array

Otherwise replace it with the char at the beginning of the numeric char array
remove first char from numeric char array



console.log(swap("abcd123") === "123dabc"); // true
*/

function swap(str) {
  let numericChars = [...str].filter(char => /[0-9]/.test(char));
  let alphaChars = [...str].filter(char => /[a-z]/i.test(char));

  strChars = str.split('');
  for (let idx = 0; idx < strChars.length; idx += 1) {
    let char = strChars[idx];
    if (/[0-9]/.test(char)) {
      if (alphaChars.length === 0) continue;
      strChars[idx] = alphaChars.splice(0, 1)[0];
    } else {
      if (numericChars.length === 0) continue;
      strChars[idx] = numericChars.splice(0, 1)[0];
    }
  }

  return strChars.join('');
}

console.log(swap("1a2b3c")) //=== "a1b2c3"); // true
console.log(swap("12a") === "a21"); // true
console.log(swap("ab1") === "1ba"); // true
console.log(swap("abcd") === "abcd"); // true
console.log(swap("1") === "1"); // true
console.log(swap("abcd123")) //=== "123dabc"); // true
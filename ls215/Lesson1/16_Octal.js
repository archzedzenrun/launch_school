/*
Input: String
Output: Integer

Rules:
-Convert string rep of an octal number as a number.

Algorithm:
-Split input string into an array of characters.
-Iterate through the chars starting with the last
  -On each iteration multiply char by 8 to the power of the current index.
-Return the sum of all numbers
*/

// function octalToDecimal(numberString) {
//   let reversedDigits = numberString.split('').reverse();
//   let nums = [];
//   for (let i = 0; i < reversedDigits.length; i += 1) {
//     nums.push(reversedDigits[i]*8**i);
//   }

//   return nums.reduce((sum, num) => sum + num);
// }

function octalToDecimal(numberString) {
  let digits = numberString.split('').reverse();
  digits = digits.map((num, idx) => num*(8**idx));
  return digits.reduce((sum, num) => sum + num);
}


console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9
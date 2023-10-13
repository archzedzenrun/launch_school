/*
a b c d e f g h i j k l m n o p q r s t u v w x y z

-Iterate through chars of input string
  -Convert char to lowercase
  -Continue to next iteration if char code isnt between 97 and 122
  -Find the char code for current char
  -If the difference between current char code and 122 (code for z) is less than 13
    -If it is, Subtract that difference from 13
    -Add that number to 96 (code before 'a') to get new char
  -If its not less than 13, add 13 to current char code

  -Convert new char code back into a string char

  -Check if original character is equal to uppercase version of the original character.
    -If it is, reassign new char to an uppercase version.

Example: o - 111, z - 122; 122 - 111 = 11
*/

const ROT_VALUE = 13;
const MIN_CHAR_CODE = 'a'.charCodeAt();
const MAX_CHAR_CODE = 'z'.charCodeAt();

function rotateChar(char) {
  let charCode = char.toLowerCase().charCodeAt();
  if (charCode < MIN_CHAR_CODE || charCode > MAX_CHAR_CODE) {
    return char;
  }

  let distanceFromZ = MAX_CHAR_CODE - charCode;
  if (distanceFromZ < ROT_VALUE) {
    charCode = (ROT_VALUE - distanceFromZ) + (MIN_CHAR_CODE - 1);
  } else {
    charCode += ROT_VALUE;
  }

  return String.fromCharCode(charCode);
}

function rot13(string) {
  return string.split('').map(function(char) {
    let newChar = rotateChar(char);
    return char === char.toUpperCase() ? newChar.toUpperCase() : newChar;
  }).join('');
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));

let testString = 'Teachers open the door, but you must enter by yourself.';
let encodedString = 'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.';

console.log(rot13(testString) === encodedString);
console.log(rot13(rot13(testString)) === testString);

let fox = "the quick brown fox jumps over the lazy dog.";
console.log(rot13(fox) === "gur dhvpx oebja sbk whzcf bire gur ynml qbt.");

// Alt solution

// const ROT_VALUE = 13;
// const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';

// function rotateChar(char) {
//   if (/[^a-zA-Z]/.test(char)) return char;
//   let charIdx = ALPHABET.indexOf(char.toLowerCase());
//   let encodedIdx = charIdx < ROT_VALUE ? charIdx + ROT_VALUE : charIdx - ROT_VALUE
//   return ALPHABET[encodedIdx];
// }

// function rot13(string) {
//   return string.split('').map(function(char) {
//     let newChar = rotateChar(char);
//     return char === char.toUpperCase() ? newChar.toUpperCase() : newChar;
//   }).join('');
// }

// console.log(rot13('Teachers open the door, but you must enter by yourself.'));
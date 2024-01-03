/*
https://edabit.com/challenge/b9FBAhxaijR9fzxgo

TIME TAKEN: 32:00
Misunderstood the problem, its to the nearest vowel present in the string, not the entire alphabet.

TOTAL TIME TAKEN AFTER FIXING: 1:15

Write a function that takes in a string and for each character, returns the distance to the nearest vowel in the string. If the character is a vowel itself, return 0.

Problem:

Input: String
Output: Array of integers

Rules:
-For each character in the string, find the distance to the nearest vowel
-Return 0 if the character is a vowel
-Return [] if input string is empty
-Input string could have uppercase chars
-Vowels are aeiou
-Strings will contain at least one vowel

Questions:
-Will there ever be less or more than 1 argument passed? -> No
-Will the input string ever be empty? -> Yes
-Will the argument always be a string type? -> Yes
-Will the string only contain alphabetic chars? -> Yes
-Will the string always contain at least one non-vowel? -> No
-Will the string contain uppercase alphabetic chars? -> It could
-What are the vowels?

distanceToNearestVowel("") // []
distanceToNearestVowel("BABBB") // [1, 0, 1, 2, 3]
distanceToNearestVowel("babbb") // [1, 0, 1, 2, 3]
distanceToNearestVowel("a") // [0]
distanceToNearestVowel("ab") // [0, 1]

Data Structure:
Array - string transformation

Notes:
Find the distance between every vowel for each character
Find the shortest distance
{ a: 5, e: 6, i:, o:, u:}

'abcdefghijklmnopqrstuvwxyz', 'b' -> index + 1 -> position 2
index of a = 0 + 1 -> 1
[1, 5, 9, 15, 21]

Algorithm:
Helper function: findSmallestDistance
-Input: String (char)
-Create an alphabet variable to a string of the alphabet
-Create a charPosition variable that will hold the input chars position in the alphabet array
-Create a vowelPostion variable with an array of vowel positions
-Iterate through the vowelPostion array
  -Transform into the difference between the charPosition and the current vowel position
-Return the smallest value

Main Function:
-Split the input string into an array of chars
-Iterate through the array of chars
  -Transform char into its smallest distance to a vowel
-Return the transformed array



Find the nearest vowel to each char in the string
Find the position (index) of all vowels in the string?
*/

// function smallestDistance(char) {
//   const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
//   let charPosition = ALPHABET.indexOf(char) + 1;
//   let vowelPositions = [1, 5, 9, 15, 21];
//   let differences = vowelPositions.map(vowelPosition => {
//     return Math.abs(vowelPosition - charPosition)
//   });

//   return Math.min(...differences);
// }

function smallestDistance(charPosition, string) {
  let vowelPositions = [...string].reduce((positionsArray, char, index) => {
    if (/[aeiou]/i.test(char)) positionsArray.push(index);
    return positionsArray;
  }, []);

  let distances = vowelPositions.map(vowelPosition => {
    return Math.abs(vowelPosition - charPosition);
  });

  return Math.min(...distances);
}

function distanceToNearestVowel(string) {
  return [...string].map((_, idx) => {
    return smallestDistance(idx, string);
  });
}

console.log(distanceToNearestVowel("")); // []
console.log(distanceToNearestVowel("BABBBA")); // [1, 0, 1, 2, 3]
console.log(distanceToNearestVowel("babbb")); // [1, 0, 1, 2, 3]
console.log(distanceToNearestVowel("a")); // [0]
console.log(distanceToNearestVowel("ab")); // [0, 1]
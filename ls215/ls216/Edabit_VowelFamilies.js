/*
TIME TAKEN: 25:00

https://edabit.com/challenge/nxSeD3tvqQkumGNid

Write a function that selects all words that have all the same vowels (in any order and/or number) as the first word, including the first word.

Input: Array of strings
Output: Array of strings

Rules:
-Select all words that have the same vowels as the first word
-Include the first word in the output
-Return empty array if input is empty
-Words dont need to have the same number of each vowel, just that they appear at least once.

Questions:
-Less or more than 1 arg passed? -> No
-Input always array? -> Yes
-Will the elements in the array always be strings? -> Yes
-Can the input array be empty? -> Yes
-Can the array be any size? -> Yes
-Will strings be all lowercase? -> Yes
-Do they have to have the same number of each vowel or is one enough? -> One is enough

Examples:
sameVowelGroup([]) // []
sameVowelGroup(["toe"]) // ["toe"]
sameVowelGroup(["toe", "teeoo"]) // ["toe", "teeoo"]
sameVowelGroup(["toe", "manicoe"]) // ["toe"] vowel groups dont match
sameVowelGroup(["toe", "ocelot", "maniac"]) ➞ ["toe", "ocelot"]

Data Structure:
Arrays

Algorithm:
Helper function:
-Input: 2 strings
-Transform each string into only its unique vowels aeiou
-Sort each string and compare them
-Return the result

Main function:
-Create a results variable to an empty array ????????
-Create a firstWord variable to the first word in the input array
-Iterate (filter) through the input array
  -Pass current word and firstWord to helper function
  -Keep the words that the helper function returns true for
-Return the filtered array
*/

function vowelGroup(word) {
  word = word.match(/[aeiou]/g);
  return [...new Set(word)].sort().join('');
}

function sameVowelGroup(array) {
  let firstWord = array[0];
  return array.filter(word => vowelGroup(word) === vowelGroup(firstWord));
}

console.log(sameVowelGroup([])); // // []
console.log(sameVowelGroup(["toe"])); // // ["toe"]
console.log(sameVowelGroup(["toe", "teeoo"])); // // ["toe", "teeoo"]
console.log(sameVowelGroup(["toe", "manicoe"])); // // ["toe"] vowel groups dont match
console.log(sameVowelGroup(["toe", "ocelot", "maniac"])); // ➞ ["toe", "ocelot"]
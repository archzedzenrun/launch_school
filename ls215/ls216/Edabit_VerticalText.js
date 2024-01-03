/*
https://edabit.com/challenge/aBMEMcMoWbbSRjFWS
TIME TAKEN: 10-15:00 with weak pedac

Create a function that converts a string into a matrix of characters that can be read vertically. Add spaces when characters are missing.

Input: String
Output: Array of arrays

Algorithm:
-Create a results array
-Split the input string into array of words
-Iterate from 0 up to the length of the longest word
  -Create a temp array
  -Iterate through the array of words
    -Push the char in the current word at the current index to the temp array
    -Push ' ' if a char doesnt exist
  -Push temp array to results
-Return results

verticalText("Holy bananas") ➞ [
  ["H", "b"],
  ["o", "a"],
  ["l", "n"],
  ["y", "a"],
  [" ", "n"],
  [" ", "a"],
  [" ", "s"]
]

Test.assertSimilar(verticalText("Holy bananas"), [['H', 'b'], ['o', 'a'], ['l', 'n'], ['y', 'a'], [' ', 'n'], [' ', 'a'], [' ', 's']])
Test.assertSimilar(verticalText("Hello fellas"), [['H', 'f'], ['e', 'e'], ['l', 'l'], ['l', 'l'], ['o', 'a'], [' ', 's']])
Test.assertSimilar(verticalText("I hope you have a great day"),
[['I', 'h', 'y', 'h', 'a', 'g', 'd'],
 [' ', 'o', 'o', 'a', ' ', 'r', 'a'],
 [' ', 'p', 'u', 'v', ' ', 'e', 'y'],
 [' ', 'e', ' ', 'e', ' ', 'a', ' '],
 [' ', ' ', ' ', ' ', ' ', 't', ' ']])

*/

function verticalText(string) {
  let results = [];
  let words = string.split(' ');
  let longestWord = Math.max(...words.map(word => word.length));
  for (let idx = 0; idx < longestWord; idx += 1) {
    let temp = [];
    words.forEach(word => {
      word[idx] ? temp.push(word[idx]) : temp.push(' ');
    })
    results.push(temp);
  }

  return results;
}

console.log(verticalText("Holy bananas")) //, [['H', 'b'], ['o', 'a'], ['l', 'n'], ['y', 'a'], [' ', 'n'], [' ', 'a'], [' ', 's']]);
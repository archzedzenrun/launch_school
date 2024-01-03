/*
Longest Substring with Non-repeating Characters
https://edabit.com/challenge/vHJrWvyEiiGp5yZtX

TIME TAKEN: 42:00

Problem:
Write a function that returns the longest non-repeating substring for a string input.

Input: String
Output: String

Rules:
-Non repeating means substring must have unique characters
-Find the lonest non repeating substring
-Only 1 argument will be passed to the function
-Return '' if input is an empty string
-The input will always be a string
-The input may contain uppercase chars
-Characters are case sensitive, a is not the same as A
-If multiple non repeating substrings have the same length, return the one that appears first

Questions:
Will there ever be less or more than 1 arguments passed? -> No
Will the input string ever be empty? -> Yes ''
Will the input type always be string? -> Yes
Will the input string ever contain uppercase characters? -> Possibly
Are lower and uppercase of the same char considered non repeating? -> Yes
Will the string only contain alphabetic chars? -> No
Can the string have numbers or other symbols? -> Yes
Can the string have any number of characters? -> Yes


Examples/Test Cases:
longestNonrepeatingSubstring("") // ''
longestNonrepeatingSubstring('a') // 'a'
longestNonrepeatingSubstring('aa') // 'aa'
longestNonrepeatingSubstring('ab') // 'a'
longestNonrepeatingSubstring('ABCABCBB') // "ABC"
longestNonrepeatingSubstring('abcA') // "abcA"
longestNonrepeatingSubstring('abcAa') // "abcA"
longestNonrepeatingSubstring("abcabcbb") // "abc"

longestNonrepeatingSubstring('abcAa') // "abcA"
a ab abc abcA abcAa
b bc bcA bcAa

Data Structure:
Arrays to find substrings

Algorithm:

-Iterate through all the substrings:
-Filter out the strings that dont have unique characters
-Find the longest string
-Return it

Helper function getSubstrings:
-Create a substrings variable (empty array)
-Split the input string into an array of chars.
-Iterate from 0 up to but not including the length of the input string (index of each char) // a
-On each iteration:
  -Slice from the 0 index up to and including the current index
  -Add substring to substrings array
-Return substrings array
*/

function getSubstrings(string) {
  let subStrings = [];
  for (let idx = 0; idx <= string.length; idx += 1) {
    let subString = string.slice(0, idx);
    subStrings.push(subString);
  }
  console.log(subStrings)
  return subStrings;
}

function nonRepeating(string) {
  return string === Array.from(new Set(string)).join('');
}

function getNonRepeatingSubstrings(string) {
  let subStrings = [];
  for (let startIdx = 0; startIdx < string.length; startIdx += 1) {
    for (let endIdx = startIdx + 1; endIdx <= string.length; endIdx += 1) {
      let subString = string.slice(startIdx, endIdx);
      if (nonRepeating(subString)) {
        subStrings.push(subString);
      }
    }
  }

  return subStrings;
}

function longestNonrepeatingSubstring(string) {
  return getNonRepeatingSubstrings(string).sort((sub1, sub2) => {
    return sub2.length - sub1.length;
  })[0];
}
  // let subStrings = [];
  // for (let idx = 0; idx < string.length; idx += 1) {
  //   subStrings.push(getSubstrings(string.slice(idx)));
  // }

  // return subStrings.flat();


// console.log(getAllSubStrings("abcabcbb"));

// function longestNonrepeatingSubstring(string) {
//   return getNonRepeatingSubstrings(string).sort((sub1, sub2) => {
//     return sub2.length - sub1.length;
//   })[0];
//   if (string === '') return '';
// console.log(getAllSubStrings(string))
//   return getAllSubStrings(string).filter(subStr => {
//     let uniqueSubStr = Array.from(new Set(subStr)).join('');
//     return subStr === uniqueSubStr;
//   }).sort((str1, str2) => str2.length - str1.length)[0];
// }

// console.log(longestNonrepeatingSubstring("")) // ''
// console.log(longestNonrepeatingSubstring('a'))// 'a'
// console.log(longestNonrepeatingSubstring('aa')) // 'a'
// console.log(longestNonrepeatingSubstring('ab')) // 'a'
// console.log(longestNonrepeatingSubstring('ABCABCBB')) // "ABC"
// console.log(longestNonrepeatingSubstring('abcA')) // "abcA"
// console.log(longestNonrepeatingSubstring('abcAa')) // "abcA"
// console.log(longestNonrepeatingSubstring("abcabcbb")) // "abc"
console.log(longestNonrepeatingSubstring('lmjsdfew')) // "abc"
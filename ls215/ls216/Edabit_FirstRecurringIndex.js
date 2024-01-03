/*
// https://edabit.com/challenge/y8fTF8GBMAXTdkrkH
TIME TAKEN: 35:00

Create a function that identifies the very first item that has recurred in the string argument passed. It returns the identified item with the index where it first appeared and the very next index where it resurfaced -- entirely as an object; or as an empty object if the passed argument is either null, undefined, empty string, or no recurring item exists.

Input: String
Output: Object with first recurring char and the indexes of its first two appearences

Rules:
-Only 1 argument passed
-null/undefined/empty string/no recurring chars returns {}
-Only uppercase alphabetic chars a-z

Questions:
-Less or more than 1 argument?
-Empty string input? -> {}
-Can the string be any size?

Examples:
recurIndex(null) ➞ {}
recurIndex(undefined) ➞ {}
recurIndex("") ➞ {}
recurIndex("A") ➞ {}
recurIndex("AA") ➞ { "A": [0, 1] }
recurIndex("ABAB") ➞ { "A": [0, 2] }
recurIndex("AREDCBSDERD") ➞ {"D": [3, 7]}

counts = {}
AREDCBSDERD
A -> { "A": [0], "D": [3]}

Data Structure:
Array?
Output: Object

Algorithm:
-Create a results variable to an empty object
-Return results if input is not a string or is an empty string
-Create a counts variable to an empty object
-Split the string into array of chars
-Iterate through the array
  -Check if current char exists in counts
  -If it does add current index to the value array
  -Otherwise:
    -Set the current char as a property in counts object and add the current index to the property value ([])
  -If the length of the value array is 2, return the property.
*/

function recurIndex(string) {
  let results = {};
  if (typeof string !== 'string' || string === '') return {};
  let counts = {};

  for (let idx = 0; idx < string.length; idx += 1) {
    let char = string[idx];
    if (counts[char]) {
      counts[char].push(idx);
      if (counts[char].length === 2) {
        results[char] = counts[char];
        break;
      }
    } else {
      counts[char] = [idx];
    }
  }

  return results;
}



// console.log(recurIndex(null)); //➞ {}
// console.log(recurIndex(undefined)); //➞ {}
// console.log(recurIndex("")); //➞ {}
console.log(recurIndex("A")); //➞ {}
console.log(recurIndex("AA")); //➞ { "A": [0, 1] }
console.log(recurIndex("ABAB")); //➞ { "A": [0, 2] }
console.log(recurIndex("AREDCBSDERD")); //➞ {"D": [3, 7]}
let [strVectors, objRes] = [[
  'DXTDXTXDTXD', 'YXZXYTUVXWV', 'YZTTZMNERXE',
  'AREDCBSDERD', '', null, 'KDXTDATTDDX',
  'AKEDCBERSDA', 'DXKETRETXDK', 'ABCKPEPGBCG',
  'KLMNONMLKOP', 'ABCDEFGHIJK', 'ABCDEFGABCD', undefined ],
  [{"D":[0,3]}, {"X":[1,3]}, {"T":[2,3]},
   {"D":[3,7]}, {}, {}, {"D":[1,4]},
   {"E":[2,6]}, {"E":[3,6]}, {"P":[4,6]},
   {"N":[3,5]}, {}, {"A":[0,7]}, {}]]
for (let i in strVectors) {
  console.log((recurIndex(strVectors[i]), objRes[i]))
}


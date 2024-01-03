/*
https://edabit.com/challenge/aewSLr2r2LMSDhPxf
TIME TAKEN: 23:00

Create a function that returns the majority vote in an array. A majority vote is an element that occurs > N/2 times in an array (where N is the length of the array).

The frequency of the majority element must be strictly greater than 1/2.

Input: Array of strings

Rules:
-Find the element that occurs more than the value of the input array length / 2
-Return null if input array is empty
-odd/even length arrays are treated the same

Questions:
-Will the array only contain strings
-Will there be less or more than 1 args? -> No
-Input always array? -> Yes
-Can the strings in the array be empty? -> No
-Can the array be empty -> Yes
-Can the array be ay length? -> yes

Examples:
[] // null
['a'] // 'a'
['a', 'a'] // 'a'
['a', 'a', 'b'] // 'a'
['a', 'a', 'b', 'b'] // null
['a', 'a', 'a', 'b', 'b', 'a'] // 'a'

Data Structure:
Store counts in an object

Algorithm:
-Create a counts variable to an empty object.
-Iterate through the input array
  -If current char exists in counts, increment by 1
  -Otherwise set char to 1
-Iterate through the entries of counts
  -If count is greater than the length of the input array / 2, return the current char
-Return null
*/


function majorityVote(array) {
  let counts = {};
  array.forEach(char => counts[char] ? counts[char] += 1 : counts[char] = 1);

  let entries = Object.entries(counts);
  for (let idx = 0; idx < entries.length; idx += 1) {
    if (entries[idx][1] > array.length / 2) return entries[idx][0];
  }

  return null;
}

console.log(majorityVote([])); // null
console.log(majorityVote(['a'])); // 'a'
console.log(majorityVote(['a', 'a'])); // 'a'
console.log(majorityVote(['a', 'a', 'b'])); // 'a'
console.log(majorityVote(['a', 'a', 'b', 'b'])); // null
console.log(majorityVote(['a', 'a', 'a', 'b', 'b', 'a'])); // 'a'


function findUnique(arr) {
  let unique = [];
  let set = new Set(arr);
  set.forEach(el => unique.push(el));
  return unique;
}

function occurrence(arr, char) {
  let count = 0;
  arr.forEach(el => {
    if (el === char) {
      count ++;
    }
  })
  return count;
}

function majorityVote(arr) {
  let targetNum = arr.length / 2;
  let uniqueArr = findUnique(arr);

  for (let idx = 0; idx < uniqueArr.length; idx ++) {
    if (occurrence(arr, uniqueArr[idx]) > targetNum) {
      return uniqueArr[idx];
    }
  }

  return null;
}

// Paco
function majorityVote(array) {
  let halfLength = array.length / 2
  let counts = countObject(array);
  let majCount = Object.values(counts).filter(count => count > halfLength);
  let majVote = Object.keys(counts).filter(vote => counts[vote] === majCount[0])
  return majVote.length === 0 ? null : majVote[0];
}

function countObject(array) {
  let counts = {};
  array.forEach(ele => counts[ele] ? counts[ele] += 1 : counts[ele] = 1);
  return counts;
}

// Esther
function uniques(array) {
  let uniqueArray = [];
  array = new Set(array);

  array.forEach(ele => uniqueArray.push(ele));
  return uniqueArray;
}

function counts(uniqueArray, array) {
  return uniqueArray.map(ele => {
    let letterCount = 0;
    array.forEach(ori => {
      if (ori === ele) {
        letterCount += 1;
      }
    })
    return letterCount;
  });
}

function majorityVote(array) {
  if (array.length === 0) return null;
  let uniqueLetters = uniques(array);
  let letterCounts = counts(uniqueLetters, array);
  let max = Math.max(...letterCounts);

  // if (max > array.length / 2) {
  //   let index = letterCounts.indexOf(max);
  //   return uniqueLetters[index];
  // } else {
  //   return null;
  // }
return max > array.length / 2 ? uniqueLetters[letterCounts.indexOf(max)] : null;

}


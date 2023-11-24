/*
Input: String
Output: Boolean

Rules:
-Words can only be spelled using the set of blocks if they dont use both letters in any block.

-Each block can only be used once.

-Characters in the input are case insensitive meaning a is the same as A

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

Examples:
isBlockWord('BATCH');      // true

B:O N:A G:T C:P H:U , all different blocks, only using 1 letter from each -> true

isBlockWord('BUTCH');      // false

B:O H:U G:T C:P H:U, there is a duplicate H:U block -> false

isBlockWord('jest');       // true

J:W R:E F:S G:T

Questions:
-Will the input ever be less or more than 1 argument? -> assume no
-Will the input ever be a type other than string? -> assume no
-Will the input ever contain non alpha chars? If so should they ignored? -> assume possible
-Will the input ever be an empty string? -> assume yes

Data Structure:
Array to hold sub arrays of blocks
Array for iteration through input string

Algorithm:
-Remove non alphabetic chars from the input string. // batch
-Uppercase the input string // BATCH
-Create a variable to hold used blocks (empty array). // []
-Create an array of subarrays containing each block.

[['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
 ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
 ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

-Iterate through the blocks array
  -Iterate through every char of the input string // B
    -If current char is included in the current block // ['B', 'O'] include? 'B' yes ->
      -Add the currnet block to the used blocks array // ['B', 'O'] is added to used blocks array


-Determine if there are any duplicate blocks in the used blocks array.
-Create an object to hold char counts
  -Iterate through used blocks and populate object counts
  -Return false if any count is greater than 1
-Otherwise return true

-Return true/false based on that
*/

// function uniqueBlocks(blocks) {
//   blocks = blocks.flat();
//   let blockCounts = {};
//   for (let idx = 0; idx < blocks.length; idx += 1) {
//     let char = blocks[idx];
//     if (blockCounts[char]) {
//       blockCounts[char] += 1;
//     } else {
//       blockCounts[char] = 1;
//     }

//     if (blockCounts[char] > 1) {
//       return false;
//     }
//   };

//   return true;
// }

// function isBlockWord(wordString) {
//   if (wordString === '') {
//     return false;
//   }

//   const BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
//   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
//   ['V', 'I'], ['L', 'Y'], ['Z', 'M']];

//   wordString = wordString.toUpperCase().replace(/[^A-Z]/g, '').split('');
//   let usedBlocks = [];
//   BLOCKS.forEach(block => {
//     wordString.forEach(char => {
//       if (block.includes(char)) {
//         usedBlocks.push(block);
//       }
//     });
//   });

//   return uniqueBlocks(usedBlocks);
// }

function isBlockWord(wordString) {
  const BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
  ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
  ['V', 'I'], ['L', 'Y'], ['Z', 'M']];

  wordString = wordString.toUpperCase().replace(/[^A-Z]/g, '');
  let usedChars = [];

  for (let stringIdx = 0; stringIdx < wordString.length; stringIdx += 1) {
    let currentChar = wordString[stringIdx];
    if (usedChars.includes(currentChar)) {
      return false;
    }

    for (let blockIdx = 0; blockIdx < BLOCKS.length; blockIdx += 1) {
      let currentBLock = BLOCKS[blockIdx];
      if (currentBLock.includes(currentChar)) {
        usedChars.push(currentBLock[0], currentBLock[1]);
      }
    }
  }

  return true;
}

// console.log(isBlockWord(''));      // false
console.log(isBlockWord('B.A3T-C=H'));      // true
console.log(isBlockWord('b.a3T-C=H'));      // true
console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('pants'));      // false
console.log(isBlockWord('date')); // true
console.log(isBlockWord('dAtE')); // true

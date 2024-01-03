/*
Input: Odd integer
Output: Integer

diamondSum(5) ➞ 104

[
  [1, 2, _, 4, 5],
  [6, _, 8, _, 10],
  [_, 12, 13, 14, _],
  [16, _, 18, _, 20],
  [21, 22, _, 24, 25]
]

Notes:
The input is always odd
The grid array will always be as many arrays as the input
First array uses the number at the middle index
From there the middle index is increased and decreased by 1 until it is 0 / array length - 1
Same for other side but reversed

Algorithm:
-Build arrays:
-Create a diamond var to empty array
  -Create a loop from 1 to the input times itself
     -Create temp var to empty array
    -Push num to temp array
    -If temp array size is equal to input num:
      -Push temp to diamond array
      -Reset temp to []

-Create results var to empty array
-Find the middle index of diamond by dividing input by 2 and rounding down
-create left/right idx vars to middleidx - 1 / middleidx + 1
-Iterate from first array



*/

function buildDiamond(size) {
  let diamond = [];
  let row = [];
  for (let num = 1; num <= size * size; num += 1) {
    row.push(num);
    if (row.length === size) {
      diamond.push(row);
      row = [];
    }
  }

  return diamond;
}

function diamondSum(size) {
  let diamond = buildDiamond(size);
  let middleIdx = Math.floor(size / 2);
  let leftIdx = middleIdx;
  let rightIdx = middleIdx;
  let results = [];

  for (let idx = 0; idx <= middleIdx; idx += 1) {
    if (idx === 0) {
      results.push(diamond[idx][middleIdx]);
    } else {
      results.push(diamond[idx][leftIdx], diamond[idx][rightIdx]);
    }

    leftIdx -= 1;
    rightIdx += 1;
  }

  leftIdx = 0;
  rightIdx = diamond.length - 1

  for (let idx = middleIdx + 1; idx < diamond.length; idx += 1) {

    leftIdx += 1;
    rightIdx -= 1;
    if (idx === diamond.length - 1) {
      results.push(diamond[idx][middleIdx]);
    } else {
      results.push(diamond[idx][leftIdx], diamond[idx][rightIdx]);
    }
  }

  return results.reduce((total, num) => total + num);
}

  // }

  // for (let idx = middleIdx; idx >= 0; idx -= 1 ) {

  // }


console.log(diamondSum(5)); // 104
console.log(diamondSum(3)); // 20
console.log(diamondSum(1)); // 1

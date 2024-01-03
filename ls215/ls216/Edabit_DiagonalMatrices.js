/*
https://edabit.com/challenge/Lcgmf6CvjXnzFTScc
TIME TAKEN: 28:00

Write a function that diagonally orders numbers in a n x n matrix, depending on which of the four corners you originate from: upper-left (ul), upper-right (ur), lower-left (ll), lower-right (lr).

diagonalize(3, "ul") ➞ [
  [0, 1, 2],
  [1, 2, 3],
  [2, 3, 4]
]

diagonalize(4, "ur") // [3, 2, 1, 0],
                        [4, 3, 2, 1],
                        [5, 4, 3, 2],
                        [6, 5, 4, 3]

diagonalize(3, "ll") ➞ [
  [2, 3, 4],
  [1, 2, 3],
  [0, 1, 2]
]

diagonalize(5, "lr") ➞ [
  [8, 7, 6, 5, 4],
  [7, 6, 5, 4, 3],
  [6, 5, 4, 3, 2],
  [5, 4, 3, 2, 1],
  [4, 3, 2, 1, 0]
]

Notes:
Input number is the number of sub arrays in the output
Each sub array size will be the same as the input
Start at 0 in the corner of the second arg

Iterate as many times as the input num (sub array)
  Create a sub array
  Iterate as many times as the input num (filling sub array)
    -Fill sub array wich current interation num
  -Push sub array to output
If input is left, we push nums to sub arrays and push subarrays to output
If input is right, we prepend nums to sub arrays and prepend sub arrays to output

Input: Integer, string
Output: Array of subarrays

Algorithm:
-Create a results variable to an empty array
-Iterate from 0 up to but not including the input num
  -Create a subarray variable to an empty array
  -Iterate from current outer iteration num until subarray size is equal to input num

  -If upper left, push nums to subarray, pushing subarray to results
  -If lower left, push nums to subarray, prepending subarray to results
  -If upper right, prepend nums to subarray, push subarray to results
  -If lower right, prepend nums to subarray, prepending subarray to results
  -Push subarray to results array
*/

function diagonalize(size, direction) {
  let results = [];
  for (let outerNum = 0; outerNum < size; outerNum += 1) {
    let subArray = [];
    for (let innerNum = outerNum; subArray.length < size; innerNum += 1) {
      if (direction === 'ul' || direction === 'll') {
        subArray.push(innerNum);
      } else {
        subArray.unshift(innerNum);
      }
    }

    if (direction === 'ul' || direction === 'ur') {
      results.push(subArray);
    } else {
      results.unshift(subArray);
    }
  }

  return results;
}

console.log(diagonalize(3, "ul")) //➞ [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

console.log(diagonalize(4, "ur"))
// [3, 2, 1, 0],[4, 3, 2, 1],[5, 4, 3, 2],[6, 5, 4, 3]

console.log(diagonalize(3, "ll"))
// [[2, 3, 4],[1, 2, 3],[0, 1, 2]]

console.log(diagonalize(5, "lr"))
//[[8, 7, 6, 5, 4],[7, 6, 5, 4, 3],[6, 5, 4, 3, 2],[5, 4, 3, 2, 1],[4, 3, 2, 1, 0]]


/*
https://edabit.com/challenge/iPni4XaMwG6qAjxgj
TIME TAKEN: 30:00

Write a function that returns all sets of three elements that sum to 0.

Input: Array
Output: Array of subarrays (sets)

Rules:
-Input will contain negative and positive integers and 0
-Return [] if input is empty
-Array could be any size
-Size less than 3 returns []
-There wont always be a set that sums to 0

Questions:
-

Example:

threesum([]) // []
threesum([-3, -1, 4]) // [[-3, -1, 4]]
threesum([-3, -1]) // []
threesum([-3]) // []
threesum([-3, 1, 6]) // []

Algorithm:
-Crete a sets variable to an empty array
-Iterate through each number
-On each iteration:
  -Iterate from the next idx to the end of the array
  -On each iteration:
    -Iterate from the next idx to the end of the array

    -Check if sum of the 3 numbers is 0
    -If it is, check if the set already exists in sets
    -If it doesnt:
      -Push an array of the 3 numbers to the sets array
-Filter out duplicate sets
-Return sets

-Iterate through allSets
-Return false if all the numbers in the first arg match the numbers in the current iteration
-Otherwise return true
*/

// function uniqueSet(set, allSets) {
//   for (let idx = 0; idx < allSets.length; idx += 1) {
//     if (allSets[idx][0] === set[0] && allSets[idx][1] === set[1] && allSets[idx][2] === set[2]) {
//       return false;
//     }
//   }

//   return true;
// }

function uniqueSet(inputSet, allSets) {
  return !allSets.some(set => String(set) === String(inputSet));
}

// console.log(uniqueSet([0, 5, -5], [[0, 5, -5], [0, 0, 0], [5, -5, 0]]))

function threeSum(array) {
  let sets = [];
  for (let firstIdx = 0; firstIdx < array.length; firstIdx += 1) {
    for (let secondIdx = firstIdx + 1; secondIdx < array.length; secondIdx += 1) {
      for (let thirdIdx = secondIdx + 1; thirdIdx < array.length; thirdIdx += 1) {
        let set = [array[firstIdx], array[secondIdx], array[thirdIdx]];
        if (set.reduce((sum, num) => sum + num) === 0 && uniqueSet(set, sets)) {
          sets.push(set);
        }
      }
    }
  }

  return sets;
}

console.log(threeSum([0, 5, -5, 0, 0])); // [[0, 5, -5], [0, 0, 0], [5, -5, 0]]
console.log(threeSum([])); // []
console.log(threeSum([-3, -1, 4])); // [[-3, -1, 4]]
console.log(threeSum([-3, -1])); // []
console.log(threeSum([-3])); // []
console.log(threeSum([-3, 1, 6])); // []

console.log(threeSum([0, 1, -1, -1, 2])); // [[0, 1, -1], [-1, -1, 2]])
console.log(threeSum([0, 0, 0, 5, -5])); // [[0, 0, 0], [0, 5, -5]])
console.log(threeSum([0, -1, 1, 0, -1, 1])); // [[0, -1, 1], [0, 1, -1], [-1, 1, 0], [-1, 0, 1], [1, 0, -1]])
console.log(threeSum([0, 5, 5, 0, 0])); // [[0, 0, 0]])
console.log(threeSum([0, 5, -5, 0, 0])); // [[0, 5, -5], [0, 0, 0], [5, -5, 0]])
console.log(threeSum([1, 2, 3, -5, 8, 9, -9, 0])); // [[1, 8, -9], [2, 3, -5], [9, -9, 0]])
console.log(threeSum([0, 0, 0])); // [[0, 0, 0]])
console.log(threeSum([1, 5, 5, 2])); // [])
console.log(threeSum([1, 1])); // [])
console.log(threeSum([])); // [])
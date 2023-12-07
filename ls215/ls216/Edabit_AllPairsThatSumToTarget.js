// TIME TAKEN 49:00
// Create a function that returns all pairs of numbers in an array that sum to a target. Sort the pairs in ascending order with respect to the smaller number, then order each pair in this order: [smaller, larger].

/*
Input: Array of numbers , integer
Output: Array

Rules:
-Find pairs of numbers in the input that equal a target
-Sort pairs smallest to largest based on the smaller number
-Pairs should be in subarrays inside of an array
-Pairs should be unique

Implicit Rules/Questions:
-Will the array ever be empty? -> No
-Will it contain anything besides integers? -> No
-Will the array contain 0s -> Could be
-Will there be duplicate number sin the array? -> Could be
-No pairs -> []

-Will the array ever be sparse? -> No
-Will the array ever contain non-element properties? -> No
-Input array will have at least 2 numbers

-Will the second input always be a positive integer? -> Yes
-Will there ever be less or more than 2 arguments? -> No

Examples:
allPairs([1, 2, 3, 4], 5) // [[1, 4], [2, 3]]
allPairs([2, 3, 1, 4], 5) // [[2, 3], [1, 4]] -> [[1, 4], [2, 3]]
allPairs([4, 3, 2, 1], 5) // [[1, 4], [2, 3]]
allPairs([0, 1, 2, 3], 3) // [[0, 3], [1, 2]]
allPairs([1, 1, 2, 3], 3) // [[1, 2]]
allPairs([1, 2], 3) // [1, 2]
allPairs([1, 2, 3, 4), 10) // []

Data Structure:
Arrays - Iteration/Array for pairs and output

Algorithm:
Helper function to check for duplicates:
-Input: 2 element array (pair), pairs array
-Iterate through the pairs array
  -Check if first value is equal to first value in the pair array and the second value is equal to the second value in the pair array
  -If both are equal return true
-Otherwise return false

-Declare a pairs variable to an empty array
-Iterate through the input array
-On each iteration:
  -Iterate from the next index to the end of the input array
  -Check if the number in the outer iteration plus the number in the inner iteration are euqal to the target number
  -Create an array containing the smaller and larger numbers
    -Sort those numbers smallest to largest
    -Push the array to the pairs array unless the pair already exists (helper function)
-Sort the pairs array based on the smaller number and return the result
*/

function duplicatePair(pair, pairs) {
  for (let idx = 0; idx < pairs.length; idx += 1) {
    if (pairs[idx][0] === pair[0] && pairs[idx][1] === pair[1]) {
      return true;
    }
  }

  return false;
}

// console.log(duplicatePair([1, 2], [[1, 2]]))

function allPairs(numbers, target) {
  let pairs = []
  numbers.forEach((num1, idx) => {
    numbers.slice(idx + 1).forEach(num2 => {
      if (num1 + num2 === target) {
        let pair = [num1, num2];
        pair.sort((n1, n2) => n1 - n2);
        if (!duplicatePair(pair, pairs)) {
          pairs.push(pair);
        }
      }
    })
  })

  return pairs.sort((pair1, pair2) => pair1[0] - pair2[0]);
}

console.log(allPairs([1, 2, 3, 4], 5)) // [[1, 4], [2, 3]]
console.log(allPairs([2, 3, 1, 4], 5)) // [[2, 3], [1, 4]] -> [[1, 4], [2, 3]]
console.log(allPairs([3, 2, 1, 4], 5))
console.log(allPairs([4, 3, 2, 1], 5)) // [[1, 4], [2, 3]]
console.log(allPairs([0, 1, 2, 3], 3)) // [[0, 3], [1, 2]]
console.log(allPairs([1, 1, 2, 3], 3)) // [[1, 2]]
console.log(allPairs([1, 2], 3)) // [1, 2]
console.log(allPairs([1, 2, 3, 4], 10)) // []

console.log(allPairs([2, 4, 5, 3], 7)) //➞ [[2, 5], [3, 4]]
// 2 + 5 = 7, 3 + 4 = 7

console.log(allPairs([5, 3, 9, 2, 1], 3)) //➞ [[1, 2]]

console.log(allPairs([4, 5, 1, 3, 6, 8], 9)) //➞ [[1, 8], [3, 6], [4, 5]]
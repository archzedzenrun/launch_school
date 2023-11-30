/*
[1, 2, 3, 4, 5, 6, 7, 8, 9 10]

Find the square of the sum

FInd the  sum of the squares

FInd the difference between the two

Implicit Rules:
-1 is the first positive integer

Algorithm:
-Create an array of numbers starting at 1 up to and including the input argument.
-Find the sum of the array and square it
-Find the sum of the array after squaring each number inside it
-Find the difference between the two
-Return the result
*/

function sumSquareDifference(num) {
  let numsArray = [];
  for (let i = 1; i <= num; i += 1) {
    numsArray.push(i);
  }

  let squaredSum = numsArray.reduce((sum, num) => sum + num) ** 2;
  let sumOfSquares = numsArray.map(num => num**2).reduce((sum, num) => {
    return sum + num;
  });

  return squaredSum - sumOfSquares;
}

console.log(sumSquareDifference(3));      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
console.log(sumSquareDifference(10));     // 2640
console.log(sumSquareDifference(1));      // 0
console.log(sumSquareDifference(100));    // 25164150
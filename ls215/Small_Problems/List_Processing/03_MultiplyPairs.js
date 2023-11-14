/*
DS: Array

Algorithm:
-Initialize a pairs variable to an empty array
-Iterate through first array
  -Iterate through second array
    -Multiply current num from outer iteration with current num from inner iteration and add to pairs array
-Sort the pairs array in asecnding numerical order
-Return the pairs array
*/

function multiplyAllPairs(arr1, arr2) {
  let pairs = [];
  for (let num1 of arr1) {
    for (let num2 of arr2) {
      pairs.push(num1 * num2);
    }
  }

  console.log(pairs.sort((a, b) => a - b));
}

multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]
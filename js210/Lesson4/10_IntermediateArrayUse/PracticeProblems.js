// Problem 1 ------------------------------------------------------------------
function oddElementsOf(arr) {
  let oddArr = [];
  for (let i = 1; i <= arr.length; i += 2) {
    oddArr.push(arr[i]);
  }

  return oddArr;
}

// let digits = [4, 8, 15, 16, 23, 42];
// console.log(oddElementsOf(digits));    // returns [8, 16, 42]

// Problem 2 ------------------------------------------------------------------
function mirroredArray(arr) {
  let reversedArr = arr.slice().reverse();
  return arr.concat(reversedArr);
}

// let digits = [4, 8, 15, 16, 23, 42];
// console.log(mirroredArray(digits));  // returns [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4]
// console.log(digits);

// Problem 3 ------------------------------------------------------------------
function sortDescending(arr) {
  return arr.toSorted((a, b) => b - a);
}

// let array = [23, 4, 16, 42, 8, 15];
// let result = sortDescending(array);
// console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
// console.log(array);                  // logs    [23, 4, 16, 42, 8, 15]

// Problem 4 ------------------------------------------------------------------
function matrixSums(arr) {
  return arr.map(function(subarr) {
    return subarr.reduce((sum, num) => sum + num, 0);
  });
}

// console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]]));  // returns [15, 60, 12]

// Problem 5 ------------------------------------------------------------------
function uniqueElements(arr) {
  let uniqueArr = [];
  for (let element of arr) {
    if (uniqueArr.includes(element)) continue;
    uniqueArr.push(element);
  }

  return uniqueArr;
}

// console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]));  // returns [1, 2, 4, 3, 5]

// Problem 6 ------------------------------------------------------------------
function missing(arr) {
  let missingNums = [];
  for (let i = arr[0]; i < arr[arr.length - 1]; i += 1) {
    if (!arr.includes(i)) {
      missingNums.push(i);
    }
  }

  return missingNums;
}

console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
// Problem 1 ------------------------------------------------------------------
function push(arr, value) {
  arr[arr.length] = value;
  return arr.length
}

// let count = [0, 1, 2];
// console.log(count);
// console.log(push(count, 3));         // 4
// console.log(count);                  // [ 0, 1, 2, 3 ]

// Problem 2 ------------------------------------------------------------------
function pop(arr) {
  if (arr.length === 0) return undefined;
  let lastElement = arr[arr.length - 1]
  arr.length = arr.length - 1
  return lastElement;
}

// let count = [];
// console.log(pop(count));             // 3
// console.log(count);                  // [ 1, 2 ]

// Problem 3 ------------------------------------------------------------------
function unshift(arr, value) {
  for (let i = arr.length; i > 0; i -= 1) {
    arr[i] = arr[i - 1]
  }
  arr[0] = value;
  return arr.length;
}

// let count = [1, 2, 3];
// console.log(unshift(count, 0));      // 4
// console.log(count);                  // [ 0, 1, 2, 3 ]

// Problem 4 ------------------------------------------------------------------
function shift(arr) {
  if (arr.length === 0) return undefined;
  let ogLength = arr.length;
  let firstElement = arr[0];
  for (let i = 0; i < arr.length; i += 1) {
    arr[i] = arr[i + 1];
  }

  arr.length = ogLength - 1;
  return firstElement;
}

// let count = [];
// console.log(shift(count));           // 1
// console.log(count);                  // [ 2, 3 ]

// Problem 5 ------------------------------------------------------------------
function indexOf(arr, value) {
  for (let i = 0; i < arr.length; i += 1) {
    if (arr[i] === value) return i;
  }

  return -1;
}

// console.log(indexOf([1, 2, 3, 3], 3));         // 2
// console.log(indexOf([1, 2, 3], 4));            // -1

// Problem 6 ------------------------------------------------------------------
function lastIndexOf(arr, value) {
  for (let i = arr.length - 1; i >= 0; i -= 1) {
    if (arr[i] === value) return i;
  }

  return -1;
}

// console.log(lastIndexOf([1, 2, 3, 3], 3));     // 3
// console.log(lastIndexOf([1, 2, 3], 4));        // -1

// Problem 7 ------------------------------------------------------------------
function slice(arr, start, end) {
  let newArr = [];
  for (let i = start; i < end; i += 1) {
    push(newArr, arr[i]);
  }

  return newArr;
}

// console.log(slice([1, 2, 3, 4, 5], 0, 2));                      // [ 1, 2 ]
// console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));  // [ 'b', 'c' ]

// Problem 8 ------------------------------------------------------------------
function splice(arr, start, valueCount) {
  let removedValues = [];
  for (let i = start; i < start + valueCount; i += 1) {
    push(removedValues, arr[i])
    arr[i] = arr[i + valueCount];
  }
  arr.length = arr.length - removedValues.length;
  return removedValues;
}

// let count = [1, 2, 3, 4, 5, 6, 7, 8];
// console.log(splice(count, 2, 5));                   // [ 3, 4, 5, 6, 7 ]
// console.log(count);                                 // [ 1, 2, 8 ]

// Problem 9 ------------------------------------------------------------------
function concat(arr1, arr2) {
  let newArr = [];
  for (let i = 0; i < arr1.length; i += 1) {
    push(newArr, arr1[i]);
  }

  for (let i = 0; i < arr2.length; i += 1) {
    push(newArr, arr2[i]);
  }

  return newArr;
}

// console.log(concat([1, 2, 3], [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]

// Problem 10 -----------------------------------------------------------------
function join(arr, str) {
  let newStr = '';
  for (let i = 0; i < arr.length; i += 1) {
    newStr += arr[i];
    if (i < arr.length - 1) newStr += str;
  }

  return newStr;
}

// console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
// console.log(join([1, 2, 3], ' and '));                 // '1 and 2 and 3'

// Problem 11 -----------------------------------------------------------------
function arraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) return false;

  for (let i = 0; i < arr1.length; i += 1) {
    if (arr1[i] !== arr2[i]) return false;
  }

  return true;
}

console.log(arraysEqual([1], [1]));                               // true
console.log(arraysEqual([1], [2]));                               // false
console.log(arraysEqual([1, 2], [1, 2, 3]));                      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));       // true
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));    // false
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));       // false
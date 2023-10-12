// Problem 1 ------------------------------------------------------------------
function push(arr, value) {
  if (arr.length === 0) return undefined;
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
  if (arr.length === 0) return undefined;
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
// Problem 1 ------------------------------------------------------------------
function lastInArray(arr) {
  return arr[arr.length - 1];
}

console.log(lastInArray([1, 2, 3, 4]));

// Problem 2 ------------------------------------------------------------------
const NAMES = ['Steve', 'Martha', 'Pat'];

function rollCall(arr) {
  for (let i = 0; i < arr.length; i += 1) {
    console.log(arr[i]);
  }
}

rollCall(NAMES);

// Problem 3 ------------------------------------------------------------------
const NUMBERS = [1, 2, 3, 4, 5];

function reverseArray(arr) {
  let reversedArray = [];
  for (let i = arr.length - 1; i >= 0; i -= 1) {
    reversedArray.push(arr[i]);
  }
  return reversedArray;
}

console.log(reverseArray(NUMBERS));

// Problem 4 ------------------------------------------------------------------

function arrayToString(arr) {
  let str = '';
  for (let i = 0; i < arr.length; i += 1) {
    str += String(arr[i]);
  }

  return str;
}

console.log(arrayToString([1, 2, 3]));
// Problem 1 ------------------------------------------------------------------
function firstElementOf(arr) {
  return arr[0];
}

// console.log(firstElementOf(['U', 'S', 'A']));  // returns "U"

// Problem 2 ------------------------------------------------------------------
function lastElementOf(arr) {
  return arr[arr.length - 1];
}

// console.log(lastElementOf(['U', 'S', 'A']));  // returns "A"

// Problem 3 ------------------------------------------------------------------
function nthElementOf(arr, index) {
  return arr[index];
}

// let digits = [4, 8, 15, 16, 23, 42];

// console.log(nthElementOf(digits, 3));   // returns 16
// console.log(nthElementOf(digits, 8));   // what does this return? undefined
// console.log(nthElementOf(digits, -1));  // what does this return? undefined

// Problem 4 ------------------------------------------------------------------
// Yes because arrays are objects.

// Problem 5 ------------------------------------------------------------------
function firstNOf(arr, count) {
  return arr.slice(0, count);
}

// let digits = [4, 8, 15, 16, 23, 42];
// console.log(firstNOf(digits, 3));    // returns [4, 8, 15]

// Problem 6 ------------------------------------------------------------------
function lastNOf(arr, count) {
  // return arr.reverse().slice(0, count).reverse();
  return arr.slice(arr.length - count);
}

// let digits = [4, 8, 15, 16, 23, 42];
// console.log(lastNOf(digits, 3));    // returns [16, 23, 42]

// Problem 7 ------------------------------------------------------------------
function lastNOf(arr, length) {
  let idx = arr.length - length
  if (idx < 0) idx = 0;

  return arr.slice(idx);
}

let digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 8));    // returns [4, 8, 15, 16, 23, 42]

// Problem 8 ------------------------------------------------------------------
function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length - 1]];
}

console.log(endsOf([4, 8, 15], [16, 23, 42]));  // returns [4, 42]
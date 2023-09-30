let x = '13';
let y = 9;

console.log(Number(x) + y);

// ------------------------------------------------------
// Unlike the plus operator, other symbols like * try to coerce any strings to numbers before performing the calculation.

// ------------------------------------------------------
let npa = 212;
let nxx = 555;
let num = 1212;

console.log(String(npa) + String(nxx) + String(num));

// ------------------------------------------------------
let bool = true;
let arr = [1, 2, 3];

console.log(bool.toString());
console.log(arr.toString());
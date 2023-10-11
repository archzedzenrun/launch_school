/*
Algorithm:
-Convert the number to a string
-If the length of the num is odd, double and return the number.
-Create variables for left and right side digits
-Iterate through the string chars
  -If index is less than the length of the string divided by 2
    -Add char to left side
  -Otherwise add to right side
-Check if left is equal to right side
  -If it is return the number
-Otherwise double and return the number
*/

function twice(num) {
  let stringNum = String(num);
  if (stringNum.length % 2 === 1) return num * 2;

  let leftSide = '';
  let rightSide = '';

  for (let i = 0; i < stringNum.length; i += 1) {
    if (i < stringNum.length / 2) {
      leftSide += stringNum[i];
    } else {
      rightSide += stringNum[i];
    }
  }

  return leftSide === rightSide ? num : num * 2;
}

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676
/*
735291 -> 352917
Keep 1 digit in place -> 3 52917 -> 3 29175
Keep 2 digits in place -> 32 9175 -> 32 1759
Keep 3 digits in place -> 321 759 -> 321 597
Keep 4 digits in place -> 3215 97 -> 3215 79

Algorithm:
-Starting at the first (0) index
-Split the numbers into two halfs with the first half being as many digits as indicted by the current index

  -The second half is from digit after the current index to the end of the number
  -Rotate the second half
-Repeat this until the index is equal to the number length - 1
*/



function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return undefined;
  } else if (arr.length === 0) {
    return [];
  }

  arr = arr.slice();
  arr.push(arr.shift());
  return arr;
}

function rotateRightmostDigits(number, numToRotate) {
  let digits = [...String(number)];
  let slicePoint = digits.length - numToRotate;
  let firstHalf = digits.slice(0, slicePoint);
  let secondHalf = rotateArray(digits.slice(slicePoint));
  return Number(firstHalf.concat(secondHalf).join(''));
}

function maxRotation(number) {
  for (let idx = String(number).length; idx > 1; idx -= 1) {
    number = rotateRightmostDigits(number, idx);


  }

  return number;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845
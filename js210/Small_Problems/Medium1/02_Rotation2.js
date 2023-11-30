/*
Algorithm:
-From the end of the number, count to to the left as many times as indicated by the second argument
-Move that number to the end of the number
-Return the new number
*/

// function rotateRightmostDigits(number, numToRotate) {
//   let digits = [...String(number)];
//   let rotateIdx = digits.length - numToRotate;
//   digits.push(digits.splice(rotateIdx, 1)[0]);
//   return Number(digits.join(''));
// }

// Using function from previous problem

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

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917
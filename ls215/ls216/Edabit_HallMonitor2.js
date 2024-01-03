/*
https://edabit.com/challenge/yPa5YwAoqfdJuWK4C
TIME TAKEN: 30:00

Input: Array
Output: Boolean

Algorithm:
-Iterate through the input array
  -If ele is 1, next ele must be 2
  -If ele is 2, next ele must be 1 or 'H'
  -If ele is 'H', next ele must be '2' or '4'
  -If ele is 3, next ele must be 4
  -If ele eis 4, next ele must be 3 or 'H'
  -If any of these arent true, return false
-Otherwise return true
*/

function possiblePath(path) {
  for (let i = 0; i < path.length - 2; i += 1) {
    let curEle = path[i];
    let nextEle = path[i + 1];
    // console.log(curEle, nextEle)

    if (curEle === 1 && nextEle !== 2) {
      return false;
    } else if (curEle === 2 && /[^1H]/.test(nextEle)) {
      return false;
    } else if (curEle === 'H' && (nextEle !== 2 && nextEle !== 4)) {
      return false;
    } else if (curEle === 3 && nextEle !== 4) {
      return false;
    } else if (curEle === 4 && (nextEle !== 3 && nextEle !== 'H')) {
      return false;
    }
  }

  return true;
}

// console.log(possiblePath([1, 2, "H", 4, 3])); // ➞ true

console.log(possiblePath(["H", 1, 2])); // ➞ false

// console.log(possiblePath([4, 3, 4, "H", 4, "H"])); // ➞ true
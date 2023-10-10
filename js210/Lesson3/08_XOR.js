/*
Algorithm:
-Check if either argument is truthy
  -If other argument is false return true
*/

function isXor(arg1, arg2) {
  if (!!arg1 && !!arg2 === false) {
    return true;
  } else if (!!arg2 && !!arg1 === false) {
    return true;
  }

  return false;
}

// LS Solution

function isXor(arg1, arg2) {
  if (arg1 && !arg2) {
    return true;
  } else if (arg2 && !arg1) {
    return true;
  } else {
  return false;
  }
}


console.log(isXor(false, true));  // true
console.log(isXor(true, false));  // true
console.log(isXor(false, false));    // false
console.log(isXor(true, true));      // false


console.log(isXor(false, 3));        // true
console.log(isXor('a', undefined));  // true
console.log(isXor(null, ''));        // false
console.log(isXor('2', 23));  // false
// Treat uppercase and lowercase chars the same
// Ignore multiple spaces

// Algorithm:
// Create an object to hold char counts
// Split input string into array of chars
// Iterate over chars array
//   On each iteration check if current char (downcased) already exists in counts object
//     If it does return false
//   Set current char as a property with a count as the value.
// return true

function isAllUnique(string) {
  string = string.toLowerCase().split(' ').join('');

  let seenChars = {};
  for (let char of string) {
    if (seenChars[char]) {
      return false;
    } else {
      seenChars[char] = true;
    }
  }

  return true;
}

console.log(isAllUnique('The quick brown fox jumped over a lazy dog'));  // false
console.log(isAllUnique('123,456,789'));                                 // false
console.log(isAllUnique('The big apple'));                               // false
console.log(isAllUnique('The big apPlE'));                               // false
console.log(isAllUnique('!@#$%^&*()'));                                  // true
console.log(isAllUnique('abcdefghijklmnopqrstuvwxyz'));                  // true
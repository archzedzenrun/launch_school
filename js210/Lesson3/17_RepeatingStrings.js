function repeat(string, times) {
  if (!Number.isInteger(times) || times < 0) {
    return undefined;
  } else if (times === 0) {
    return "";
  }

  let new_str = '';

  for (let count = 1; count <= times; count += 1) {
    new_str += string;
  }

  return new_str;
}

console.log(repeat('abc', 1));      // "abc"
console.log(repeat('abc', 2));      // "abcabc"
console.log(repeat('abc', -1));     // undefined
console.log(repeat('abc', 0));      // ""
console.log(repeat('abc', 'a'));    // undefined
console.log(repeat('abc', false));  // undefined
console.log(repeat('abc', null));   // undefined
console.log(repeat('abc', '  '));   // undefined
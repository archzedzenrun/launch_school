function substr(string, start, length) {
  if (start < 0) {
    start = string.length + start;
  }

  let subString = '';
  for (let i = start; i < start + length; i += 1) {
    if (i >= string.length) break;
    subString += string[i];
  }

  return subString;
}

let string = 'hello world'; // string.length = 11 - 3 = 8

console.log(substr(string, 2, 4) === 'llo ')    // "llo "
console.log(substr(string, -3, 2));    // "rl"
console.log(substr(string, 8, 20));    // "rld"
console.log(substr(string, 0, -20));   // ""
console.log(substr(string, 0, 0));     // ""
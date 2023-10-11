function stringy(num) {
  let stringyString = '';
  for (let i = 0; i < num; i += 1) {
    stringyString[i - 1] === '1' ? stringyString += '0' : stringyString += '1';
  }

  return stringyString;
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"
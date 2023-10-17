function crunch(string) {
  let crunchedString = '';
  for (let i = 0; i < string.length; i += 1) {
    if (string[i] === string[i - 1]) {
      continue;
    } else {
      crunchedString = crunchedString.concat(string[i]);
    }
  }

  return crunchedString;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""
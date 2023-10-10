function toLowerCase(string) {
  let lowercaseStr = '';

  for (let i = 0; i < string.length; i += 1) {
    let charCode = string.charCodeAt(i);
    if (string[i] >= 'A' && string[i] <= 'Z') {
      charCode += 32;
    }
    lowercaseStr += String.fromCharCode(charCode);
  }

  return lowercaseStr;
}

console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
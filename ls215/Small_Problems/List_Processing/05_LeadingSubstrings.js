function leadingSubstrings(str) {
  let substrings = [];
  for (let idx = 1; idx <= str.length; idx += 1) {
    substrings.push(str.slice(0, idx));
  }

  return substrings;
}

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// Further Exploration:

function leadingSubstrings(str) {
  return str.split('').map((char, idx) => {
    return str.slice(0, idx + 1);
  })
}
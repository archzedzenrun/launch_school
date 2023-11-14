function leadingSubstrings(str) {
  return [...str].map((_, idx) => str.slice(0, idx + 1));
}

function substrings(str) {
  return [...str].flatMap((_, idx) => leadingSubstrings(str.slice(idx)));
}

// function substrings(str) {
//   let substrings = [];
//   for (let idx = 0; idx < str.length; idx += 1) {
//     let substring = str.slice(idx);
//     substrings.push(leadingSubstrings(substring));
//   }

//   return substrings.flat();
// }

console.log(substrings('abcde'));

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]
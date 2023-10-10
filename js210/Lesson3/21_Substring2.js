function substring(string, start, end) {
  if (start > end) [start, end] = [end, start];
  if (start === end) return '';
  if (end === undefined) end = string.length;
  if (isNaN(start) || start < 0) start = 0;
  if (isNaN(end) || end < 0) end = 0;
  if (start > string.length) string = string.length;
  if (end > string.length) end = string.length;

  let subString = '';
  for (let index = start; index < end; index += 1) {
    subString += string[index]
  }

  return subString;
}
let string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"
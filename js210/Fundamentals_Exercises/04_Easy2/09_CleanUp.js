/*
Algorithm:
-Initialize a new string variable

-Iterate through chars of the input string
  -Check if char is alphabetic
    -If it is add it to new string
    -Otherwise add a space to new string UNLESS the last char of new string is a space

-Return new string
*/

function cleanUp(string) {
  let cleanString = '';
  let pattern = /[a-zA-Z]/;
  for (let char of string) {
    if (cleanString[cleanString.length - 1] === ' ' && !pattern.test(char)) {
      continue;
    } else if (pattern.test(char)) {
      cleanString += char;
    } else {
      cleanString += ' ';
    }
  }

  return cleanString;
}

console.log(cleanUp("---what's my +*& line?"));    // " what s my line "
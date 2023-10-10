/*
Algorithm:
-Create a result variable empty string
-Iterate from 1 up to and including input number
  -Subtract input minus the length of result variable
  -Add that many asterisks to the result string.
  -Log result
  -Append current number to the result
*/

function generatePattern(num) {
  for (let line = 1; line <= num; line += 1) {
    let result = '';

    for (let digit = 1; digit <= line; digit += 1) {
      result += String(digit);
    }

    for (let count = line + 1; count <= num; count += 1) {
      result += '*';
    }

    console.log(result);
  }
}

generatePattern(7);
/*
Input: String containing numbers, possibly special characters
Output: Number

Expclit Rules:
-Return a string of 10 0's if the number is "bad".
-A bad number is a number that:
  -Is less than 10 digits
  -Is 11 digits with a first number other than 1
  -More than 11 digits
-A good number is:
  -10 digits
  -11 digits if it starts with 1
    -Trim the 1 and use the last 10
  -

Questions:
-Will the input always be a string?
-What happens if no argument is passed to the function?
-What happens if more arguments are passed than expected?
-What if the input string is empty?
-Output will only contain digits 0-9?
-What do we return if the number is good?
-When refering to 10 digits, does this mean only 0-9? does this include other chars?

Examples:

Data Structure:
String

Algorithm:
-Replace string chars that arent digits 0-9 with empty space

-If number of digits is less than 10 or greater than 11
  -Return '0000000000'
-If the number of digits is 11
  -If the first number is 1
    -Trim the 1 and return the remaining digits in the string
  -Otherwise return '0000000000'
-Otherwise return the digits string
*/

function cleanNumber(string) {
  let digits = string.replace(/[^0-9]/g, '');
  if (digits.length < 10 || digits.length > 11) {
    return '0000000000';
  } else if (digits.length === 11) {
    if (digits[0] === '1') {
      return digits.slice(1);
    } else {
      return '0000000000';
    }
  } else {
    return digits;
  }
}

console.log(cleanNumber('2888567934')) // '2888567934'
console.log(cleanNumber('2(8) 885-6.7934')) // '2888567934'
console.log(cleanNumber('12888567934')) // '2888567934'
console.log(cleanNumber('62888567934')) // '0000000000'
console.log(cleanNumber('')) // '0000000000'
console.log(cleanNumber('4534353535683012')) // '0000000000'
console.log(cleanNumber('6657934')) // '0000000000'
/*
Input: String of digits (possibly non numeric chars)
Output: Boolean

Questions:
-Is boolean the expected output?
-What happens if the input is empty? -> assumed return of false
-Will the input always be a string? -> assumed yes
-Will there ever be no argument or more than 1 argument passed? -> assumed no
-Non numeric characters count as characters when incrementing every second char?

Rules:
-Verify a number is valid per the Luhn formula by:
  -Doubling the value of every second digit starting at the right most digit.
  -If the resulting doubled digit is 10 or more, subtract 9 from it.
  -Add the digits together
-If the checksum (total) ends in 0, the number is valid, otherwise its invalid.
-Ignore non-numeric characters in the input.


Data Structure:
Array for characters of input string

Algorithm:
-Remove any non digit characters (0-9) from the input string
-Split the string of digits into an array
-Reverse the digits array
-Iterate through the reversed digits
  -Check if current index is an odd number
    -If it is, double the current number
      -Check if doubled number is greater or equal to 10
        -If it is, subtract 9 from the number
    -Otherwise leave the number alone

-Find the sum of the digits array
-Check if the last digit of the sum is 0
  -If it is return true
  -Otherwise return false
*/

function sum(digits) {
  return digits.reduce((total, num) => total + num);
}

function endsWith0(num) {
  num = String(num);
  return num[num.length - 1] === '0';
}

function validNumber(string) {
  if (string === '') {
    return false;
  }

  let splitString = string.replace(/[^0-9]/g, '').split('');
  let reversedDigits = splitString.reverse();
  let transformedDigits = reversedDigits.map((digit, index) => {
    digit = Number(digit);
    if (index % 2 !== 0) {
      let doubledDigit = digit * 2;
      if (doubledDigit >= 10) {
        doubledDigit -= 9;
      }
      return doubledDigit;
    } else {
      return digit;
    }
  });

  let checksum = sum(transformedDigits);
  return endsWith0(checksum);
}

console.log(validNumber('')); // false
console.log(validNumber('8763')); // 20, ends in 0 -> true
console.log(validNumber('1111')); // ends in 6 -> false
console.log(validNumber('a8b76.3')); // 20, ends in 0 -> true
console.log(validNumber('2323 2005 7766 3554'))

function makeValid(string) {
  if (validNumber(string)) {
    return string;
  }

  for (let num = 0; num < 10; num += 1) {
    let currentNum = string + String(num);
    if (validNumber(currentNum)) {
      return currentNum;
    }
  }
}

console.log(makeValid('2323 2005 7766 355')); // '2323 2005 7766 3554'
console.log(makeValid('8763'));
/*
*PROBLEM*

Input: String representation of 2 numbers
Output: Integer (1, -1, 0)

Explicit Rules:
-Compare the 2 input numbers
-Determine if first number is greater, less than, or equal to second number
  How are the numbers compared?
  -Check if the numbers are the same size (meaning same amount of '.')
  -If they are then compare number values between the '.' at the same position in each number

-If either number contains any chars besides 0-9 or '.', return null
-Return 1 if num1 > num2
-Return -1 if num1 < num2
-Return 0 if they are equal

Implicit Rules:
-Will either input ever be empty?
-Is there a limit to how many decimals in the numbers?
-Will either input ever be 0 or a negative number?

0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37

Data Structure:
Strings -> Array of chars

Algorithm:
-Check if any of the chars in either input string are non 0-9 or '.'
  -If they are, return null

-Split each input at the '.' into an array of chars
-Check if the length of array 1 is less than/greater than/equal to length of array 2,
  -Return -1 if array1 length is less than array2 length
  -Return 1 if array1 length is greater than array 2 length
  -If they are the same length:
    -Iterate through array1
      -Compare the numeric value of current char with char at the current index in array2
      -Return 1 if current char is greater, -1 if its less
      -Otherwise return 0 at the end of iteration
*/

function invalidVersion(num) {
  return /[^0-9.]/.test(num);
}

function comparelengths(num1, num2) {
  if (num1.length < num2.length) {
    return -1;
  } else if (num1.length > num2.length) {
    return 1;
  } else {
    return 0;
  }
}

function compareValues(num1, num2) {
  for (let idx = 0; idx < num1.length; idx += 1) {
    let number1 = Number(num1[idx]);
    let number2 = Number(num2[idx]);
    if (number1 > number2) {
      return 1;
    } else if (number1 < number2) {
      return -1;
    }
  }

  return 0;
}

function compareVersions(num1, num2) {
  if (invalidVersion(num1) || invalidVersion(num2)) {
    return null;
  }

  num1 = num1.split('.');
  num2 = num2.split('.');
  let lengths = (comparelengths(num1, num2))
  if (lengths === 0) {
    return compareValues(num1, num2);
  } else {
    return lengths;
  }
}

// console.log(compareVersions('1', '1'));
// console.log(compareVersions('2.9', '2.1.1')); // -1, num1 has less '.'
// console.log(compareVersions('2.1.1', '2.2')); // 1, num1 has more '.'
// console.log(compareVersions('2.9', '2.9')); // 0, they are equal
// console.log(compareVersions('abc', '1.5')); // null non 0-9 chars
// console.log(compareVersions('1.5', 'abc')); // null
// console.log(compareVersions('5', '5.0.1')); // -1
// console.log(compareVersions('2.3.5.1', '2.3.5.5' )); // -1
// console.log(compareVersions('2.4.5.1', '2.3.9.9' )); // 1
console.log(compareVersions('1', '1'));            // 0
console.log(compareVersions('1.1', '1.0'));        // 1
console.log(compareVersions('2.3.4', '2.3.5'));    // -1
console.log(compareVersions('1.a', '1'));          // null
console.log(compareVersions('.1', '1'));           // null
console.log(compareVersions('1.', '2'));           // null
console.log(compareVersions('1..0', '2.0'));       // null
console.log(compareVersions('1.0', '1.0.0'));      // 0
console.log(compareVersions('1.0.0', '1.1'));      // -1
console.log(compareVersions('1.0', '1.0.5'));      // -1

/*
Will the array ever be empty? or contain non strings?
Will the given integer always be a positive integer?

What does "largest" mean?
What does "greatest number" mean?
Is it possible an argument wont be passed? How should i handle that?
Will the argument always be an array? If not how should i handle that?
Will the array always contain only positive integers?
Will the array ever contain non integers?
What if there is only one number in the array?
Can the array contain more or less numbers than 3?
What is meant by "not allowed to sort"? The sort method?

What if no argument is passed?
Will there always be only one argument? How do i handle more arguments?
What if there are no prime numbers present?
Will the input always be a string? How do i handle other inputs?
Can the string be empty?

What if no argument is passed?
Will there ever be more than 1 argument passed?
Will the input always be an array?
Will the array only contain numbers and strings?
Will the numbers always be positive?
Will the arrays ever be sparse?
*/
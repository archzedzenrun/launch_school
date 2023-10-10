/*
Rules:
-Log numbers from 1 up to and including 100 that are multiples of 3 or 5.
-If it is divisible by both, append ! to the number.
-Output: String

Divisible means a number can be divided by another number without a remainder.
For example 4 % 2 is 0 - 4 is divisible by 2. 4 % 3 is 1 4 is not divisible by 3.

Algorithm:
-Iterate from 1 up to and including 100.
  -Check if current number is divisible by 3 or 5
    -Log the current num
  -Check if current number is divisible by both
    -Append ! and log the number
*/

function multiplesOfThreeAndFive() {
  for (let i = 1; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i));
    }
  }
}

multiplesOfThreeAndFive();

// Further Exploration:

function multiplesOfThreeAndFive(min, max) {
  for (let i = min; i <= max; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i));
    }
  }
}

multiplesOfThreeAndFive(5, 25);
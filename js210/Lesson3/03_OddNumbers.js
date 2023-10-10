/*
Input: Positive integer

Rules:
-Log all odd numbers from 1 up to and including the input number.
-Log numbers on separate lines.

Algorithm:
-Iterate over a range of numbers between 1 and the input
  -Check if current number is odd
    -Divide number by 2, if the remaineder is not 0, log the number
*/

function logOddNumbers(num) {
  for (let i = 1; i <= num; i += 1) {
    if (i % 2 !== 0) console.log(i);
  }
}

logOddNumbers(19);

// Further Exploration:

function logOddNumbers(num) {
  for (let i = 1; i <= num; i += 2) {
    console.log(i);
  }
}

logOddNumbers(19);

function logOddNumbers(num) {
  for (let i = 0; i <= num; i += 1) {
    if (i % 2 === 0) continue;
    console.log(i);
  }
}

logOddNumbers(19);
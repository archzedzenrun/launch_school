/*
Algorithm:
-Iterate from 1 up to and including 100.
  -CHeck if num is a multiple of 3 and 5
    -Log FizzBuzz
  -Check if num is a multiple of 3
    -Log Fizz
  -Check if num is a multiple of 5
    -Log Buzz
  -Otherwise log the number.
*/

function fizzBuzz() {
  for (let i = 1; i <= 100; i += 1) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log('FizzBuzz');
    } else if (i % 3 === 0) {
      console.log('Fizz');
    } else if (i % 5 === 0) {
      console.log('Buzz');
    } else {
      console.log(i);
    }
  }
}

fizzBuzz();

// Further Exploration:

function fizzBuzz() {
  for (let i = 1; i <= 100; i += 1) {
    let output = '';
    if (i % 3 === 0) output += 'Fizz';
    if (i % 5 === 0) output += 'Buzz';
    console.log(output || i);
  }
}
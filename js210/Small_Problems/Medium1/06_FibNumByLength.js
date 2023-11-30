/*
Fib starts at [1, 1]
Add the last 2 numbers of the fib array together and add the result to the end of the fib array
Check how many digits are in that number
If its equal to the argument passed in, return the index of the  last number in the fib array plus one
*/

function findFibonacciIndexByLength(fibLength) {
  let first = 1n;
  let second = 1n;
  let count = 2n;
  let fib;

  do {
    fib = first + second;
    count += 1n;
    first = second;
    second = fib;
  } while (String(fib).length < fibLength);

  return count;


}

console.log(findFibonacciIndexByLength(2n) === 7n);    // 1 1 2 3 5 8 13
console.log(findFibonacciIndexByLength(3n) === 12n);   // 1 1 2 3 5 8 13 21 34 55 89 144
console.log(findFibonacciIndexByLength(10n) === 45n);
console.log(findFibonacciIndexByLength(16n) === 74n);
console.log(findFibonacciIndexByLength(100n) === 476n);
console.log(findFibonacciIndexByLength(1000n) === 4782n);
console.log(findFibonacciIndexByLength(10000n) === 47847n);

// The last example may take a minute or so to run.
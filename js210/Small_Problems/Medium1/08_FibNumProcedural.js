function fibonacci(num) {
  let fib = [1, 1];
  while (fib.length < num) {
    fib.push(fib[fib.length -1] + fib[fib.length - 2]);
  }

  return fib[fib.length -1];
}

console.log(fibonacci(20));       // 6765
console.log(fibonacci(50));       // 12586269025
console.log(fibonacci(75));       // 2111485077978050
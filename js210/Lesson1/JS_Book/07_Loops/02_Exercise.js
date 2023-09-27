function factorial(num) {
  let result = 1;
  for (let counter = 1; counter <= num; counter += 1) {
    result *= counter;
  }
  return result;
}

console.log(factorial(6));
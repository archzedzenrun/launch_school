function sequence(num) {
  let result = [];
  for (let digit = 1; digit <= num; digit += 1) {
    result.push(digit);
  }

  return result;
}

console.log(sequence(5));    // [1, 2, 3, 4, 5]
console.log(sequence(3));    // [1, 2, 3]
console.log(sequence(1));    // [1]
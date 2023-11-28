function sequence(count, startingNum) {
  if (count < 1) {
    return [];
  }

  let result = [startingNum];
  while (result.length < count) {
    result.push(result[result.length - 1] + startingNum);
  }

  return result;
}

console.log(sequence(5, 1));          // [1, 2, 3, 4, 5]
console.log(sequence(4, -7));         // [-7, -14, -21, -28]
console.log(sequence(3, 0));          // [0, 0, 0]
console.log(sequence(0, 1000000));    // []
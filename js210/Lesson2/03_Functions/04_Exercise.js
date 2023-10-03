function sum(array) {
  let total = 0;
  for (let num of array) {
    total += num;
  }
  return total;
}

function average(array) {
  return sum(array) / array.length;
}

console.log(average([3, 3, 8, 3, 3]));
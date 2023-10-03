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

let temperatures = [75, 83, 56, 90, 98];
console.log(average(temperatures));
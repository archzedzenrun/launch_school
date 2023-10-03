// function average(array) {
//   let total = 0;
//   for (let idx = 0; idx < array.length; idx += 1) {
//     total += array[idx];
//   }
//   return total / array.length;
// }

function average(array) {
  let total = 0;
  for (let num of array) {
    total += num;
  }
  return total / array.length;
}

console.log(average([1,2,3]));
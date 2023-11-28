function halvsies(arr) {
  let result = [[], []];
  for (let idx = 0; idx < arr.length; idx += 1) {
    if (idx < arr.length / 2) {
      result[0].push(arr[idx]);
    } else {
      result[1].push(arr[idx]);
    }
  }

  return result;
}

console.log(halvsies([1, 2, 3, 4]));       // [[1, 2], [3, 4]]
console.log(halvsies([1, 5, 2, 4, 3]));    // [[1, 5, 2], [4, 3]]
console.log(halvsies([5]));                // [[5], []]
console.log(halvsies([]));                 // [[], []]
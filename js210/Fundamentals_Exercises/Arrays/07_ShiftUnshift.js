function shift(arr) {
  if (arr.length === 0) return undefined;
  let firstEle = arr[0];
  for (let i = 0; i < arr.length; i += 1) {
    arr[i] = arr[i + 1];
  }
  arr.length = arr.length - 1;
  return firstEle;
}

function unshift(arr, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    arr.splice(i, 0, args[i])
  }
  console.log(arr)
}

shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3

// const testArray = [1, 2, 3];
// console.log(shift(testArray));                // 1
// console.log(testArray);                       // [2, 3]
// unshift(testArray, 5);           // 3
// testArray;                       // [5, 2, 3]
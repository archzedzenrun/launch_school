function concat(...args) {
  let newArr = args[0].slice();
  args = args.slice(1);

  for (let i = 0; i < args.length; i += 1) {
    let currentEle = args[i]
    if (Array.isArray(currentEle)) {
      for (let j = 0; j < currentEle.length; j += 1) {
        newArr.push(currentEle[j]);
      }
    } else {
      newArr[newArr.length] = currentEle;
    }
  }

  return newArr;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]

// Alt concise solution

// function concat(...args){
//   return args.flat(Infinity);
// }

// console.log(concat([1, 2], ['three'], 4, [5], [6, 7, [8]], [[[[2]]]]));

function oddLengths(array) {
  let lengths = array.map(str => str.length);
  return lengths.filter(length => length % 2 !== 0);
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]
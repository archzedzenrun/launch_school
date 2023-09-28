function oddLengths(array) {
  return array.reduce((lengths, str) => {
    let length = str.length
    if (length % 2 !== 0) {
      lengths.push(str.length);
    }
    return lengths;
  }, []);
}

let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
console.log(oddLengths(arr)); // => [1, 5, 3]
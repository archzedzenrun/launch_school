function isStringArray(arr: unknown[]): arr is string[] {
  return arr.every(ele => typeof ele === 'string');
}

console.log(isStringArray([1, 2, 3]));
console.log(isStringArray(["test", "string"]));
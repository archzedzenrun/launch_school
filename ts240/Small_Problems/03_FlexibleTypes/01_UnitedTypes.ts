function wrapInArray(arg: string | number): (string | number)[] {
  return [arg];
}

console.log(wrapInArray('hi'));
console.log(wrapInArray(5));
function firstElement<T>(arr: T[]): T | undefined {
  return arr[0];
}

console.log(firstElement([7, 9, 11]))
console.log(firstElement([]))
function toUpperCaseArray(arr: string[]): string[] {
  return arr.map(str => str.toUpperCase());
}

console.log(toUpperCaseArray(['hello', 'world']))
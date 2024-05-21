function printLength(val: string | string[]): void {
  if (typeof val === 'string') {
    console.log(`String length: ${val.length}`);
  } else {
    console.log(`Array count: ${val.length}`);
  }
}

printLength("hello")
printLength(["hello", "world"])
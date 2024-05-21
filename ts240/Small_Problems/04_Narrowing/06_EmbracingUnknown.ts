function logUnknown(val: unknown): void {
  if (typeof val === 'string') {
    console.log(val);
  }
}

logUnknown('hello');
logUnknown(5);
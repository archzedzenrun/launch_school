function printId(id: number | string): void {
  if (typeof id === 'string') {
    console.log('Your ID is a string');
  } else {
    console.log('Your ID is a number')
  }
}

printId(5);
printId('five');
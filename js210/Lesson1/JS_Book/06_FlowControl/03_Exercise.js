function evenOrOdd(num) {
  if (Number(num) !== num) {
    console.log('Invalid input.');
  } else {
    console.log(num % 2 === 0 ? 'even' : 'odd');
  }
}
evenOrOdd(5);
evenOrOdd(4);
evenOrOdd('a');
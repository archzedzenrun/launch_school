function logInBox(string) {
  let solidLine = '+-';
  let emptyLine = '| ';

  for (let i = 0; i < string.length; i += 1) {
    solidLine += '-';
    emptyLine += ' ';
  }

  solidLine += '-+';
  emptyLine += ' |';

  console.log(solidLine);
  console.log(emptyLine);
  console.log(`| ${string} |`);
  console.log(emptyLine);
  console.log(solidLine);
}

logInBox('To boldly go where no one has gone before.');
logInBox('');
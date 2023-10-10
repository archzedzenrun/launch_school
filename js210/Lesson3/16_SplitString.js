function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log('ERROR: No delimiter');
    return;
  }

  let temp_str = '';
  for (let char of string) {
    if (char === delimiter) {
      console.log(temp_str);
      temp_str = '';
    } else if (delimiter === '') {
      console.log(char);
    } else {
      temp_str += char;
    }
  }

  if (temp_str) console.log(temp_str);
}

splitString('abc,123,hello world', ',');
splitString('hello');
splitString('hello', '');
splitString('hello', ';');
splitString(';hello;', ';');
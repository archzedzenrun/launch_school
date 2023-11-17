function reverse(string) {
  let reversedString = '';
  for (let idx = string.length - 1; idx >= 0; idx -= 1) {
    reversedString += string[idx];
  }

  return reversedString;
}

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"
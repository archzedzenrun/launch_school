function wordToDigit(words) {
  const DIGITS = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6,
                   seven: 7, eight: 8, nine: 9 }

  // for (let digit in DIGITS) {
  //   let regex = new RegExp(digit, 'g');
  //   words = words.replace(regex, DIGITS[digit])
  // }

  return words.split(/\b/).map(word => {
    return DIGITS[word] ? DIGITS[word] : word;
  }).join('');
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
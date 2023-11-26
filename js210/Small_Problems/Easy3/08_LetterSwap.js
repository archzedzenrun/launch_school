function swapWord(word) {
  if (word.length < 2) {
    return word;
  }

  let firstChar = word[0];
  let lastChar = word[word.length -1];
  return lastChar + word.slice(1, -1) + firstChar;
}

function swap(str) {
  return str.split(' ').map(word => swapWord(word)).join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"
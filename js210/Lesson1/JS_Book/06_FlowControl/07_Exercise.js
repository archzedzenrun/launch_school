function capitalizeLongWord(word) {
  if (word.length > 10) {
    return word.toUpperCase();
  } else {
    return word;
  }
}

console.log(capitalizeLongWord('hello'));
console.log(capitalizeLongWord('helllloooooooo'));
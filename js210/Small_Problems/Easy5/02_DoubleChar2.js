function doubleConsonants(str) {
  return [...str].map(char => {
    return /[b-df-hj-np-tv-z]/i.test(char) ? char + char : char;
  }).join('');
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""
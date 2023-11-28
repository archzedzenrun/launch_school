function reverseWords(words) {
  return words.split(' ').map(word => {
    if (word.length >= 5) {
      return [...word].reverse().join('');
    } else {
      return word;
    }
  }).join(' ');
}

console.log(reverseWords('Professional'));             // "lanoisseforP"
console.log(reverseWords('Walk around the block'));    // "Walk dnuora the kcolb"
console.log(reverseWords('Launch School'));            // "hcnuaL loohcS"
function wordSizes(str) {
  if (str.length === 0) {
    return {};
  }

  let lengths = str.split(' ').map(word => word.replace(/[^a-z]/ig, '').length);
  return lengths.reduce((counts, length) => {
    counts[length] ? counts[length] += 1 : counts[length] = 1;
    return counts;
  }, {});
}

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(wordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(wordSizes(''));                                            // {}
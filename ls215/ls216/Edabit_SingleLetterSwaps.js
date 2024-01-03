/*
https://edabit.com/challenge/xukQmQoGopXbQMdZj
TIME TAKEN: 43:00

Given an array of strings and an original string, write a function to output an array of boolean values - true if the word can be formed from the original word by swapping two letters only once and false otherwise.

Input: Array of strings, string (original word)
Output: Array of booleans

Rules:
-Transform each word into true if it can be formed by swapping only two letters in the original word. Otherwise transform to false.
-Array will not be empty, original word will not be empty
-Original word/strings in array  can be alphanumeric chars
-Strings will be uppercase/case doesnt matter
-Array could be any size

Questions:
-Will there be less or more than 2 args? -> No
-Will the first arg always be an array/second arg a string? -> Yes

Examples:
['hello'], 'lelho' // [true]
['abc', 'cab', 'def'], 'bac' // [true, true, false]
['abc123', '1bc32a'], 'abc321' // [true, true]
['123', '456'], '321' // [true, false]
['a1'], '1a' // [true]
['a'], 'ab' // [false]
['acdeb'], 'abcde' [false]

abc321
ba c321
c b a321
3 bc a 21
2 bc3 a1
1 bc32 a

Data Structure:
Arrays

Algorithm:
-Create a swappedLetters variable to an empty array
-Iterate through the chars of the original word
  -Create an array of chars from the original word
    -Iterate from the next char to the end of the word
    -Set outer idx to the char at the current inner idx
    -Set the inner idx to the har at the outer idx
    -Push the array to swappedLetters
-Iterate through the input array
  -Transform word to true if its included in the swappedLetters array
  -Otherwise transform to false
-Return transformed array
*/

function validateSwaps(array, originalWord) {
  let swappedLetters = [];
  for (let outerIdx = 0; outerIdx < originalWord.length; outerIdx += 1) {
    for (let innerIdx = outerIdx + 1; innerIdx < originalWord.length; innerIdx += 1) {
      let wordCopy = [...originalWord];
      wordCopy[outerIdx] = originalWord[innerIdx];
      wordCopy[innerIdx] = originalWord[outerIdx];
      swappedLetters.push(wordCopy.join(''));
    }
  }

  return array.map(word => swappedLetters.includes(word));
}

console.log(validateSwaps(['hello'], 'lelho')); // [true]
console.log(validateSwaps(['abc', 'cab', 'def'], 'bac')); // [true, true, false]
console.log(validateSwaps(['abc123', '1bc32a'], 'abc321')); // [true, true]
console.log(validateSwaps(['123', '456'], '321')); // [true, false]
console.log(validateSwaps(['a1'], '1a')); // [true]
console.log(validateSwaps(['a'], 'ab')); // [false]
console.log(validateSwaps(['acdeb'], 'abcde')); // [false]


console.log(validateSwaps(['BACDE', 'EBCDA', 'BCDEA', 'ACBED'], 'ABCDE')); //[true, true, false, false]
console.log(validateSwaps(['32145', '12354', '15342', '12543'], '12345')); //[true, true, true, true])
console.log(validateSwaps(['9786', '9788', '97865', '7689'], '9768')); //[true, false, false, false])
console.log(validateSwaps(['123', '321', '132', '13', '12'], '213')); // [true, false, false, false, false]
console.log(validateSwaps(['123', '1234', '1235'], '12')); //[false, false, false])
console.log(validateSwaps(['123', '123', '123'], '133')); //[false, false, false])
console.log(validateSwaps(['132', '321', '213'], '123')); //[true, true, true])

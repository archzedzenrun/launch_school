// Write a function that removes the last vowel in each word in a sentence.
// Vowels are: a, e, i, o, u (both upper and lowercase).
// https://edabit.com/challenge/rEyBNGafoHLYmyKfj
// TIME TAKEN: 40:00

/*
Input: String
Output: String with last vowels of each word removed

Rules:
-Vowels are aeiou AEIOU

Questions/Implicit Rules:
-Vowels are case sensitive

-Will the input string ever be empty? Yes -> ''
-Will the input ever be anything besides string? -> No
-Will there ever be less or more than 1 arguments? -> No
-Will every word have a vowel? -> No -> Leave the word unchanged 'myth' -> 'myth'

removeLastVowel("") // ''
removeLastVowel("Myth") // "Myth"
removeLastVowel("Hello myth") // "Hell myth"
removeLastVowel("ThosE whO dare") // "Thos wh dar"

// Creating test cases as you ask questions

// question - How to handle no vowels
// good that you went back to fill out algorithm


Data Structure:
Array - To hold words/iteration

Algorithm:
-Split the input string into an array of words.
-Iterate over the words array.
  -Transform the word with the helper function

  Helper function to remove last vowel:  miserably
  -Input: string
  -Reverse the string - ylbaresim
  -Iterate through the chars of the string
    -Check if current char is lower/uppercase vowel
    -If it is slice the string from the beginning up to the current index and combine it with the rest of the string after the current index ylb + resim
    -Reverse the combined string and return it - miserbly
*/

function removeVowel(word) {
  let newString = ''
  let reversedWord = [...word].reverse();

  for (let idx = 0; idx < reversedWord.length; idx += 1) {
    let char = reversedWord[idx];
    if (/[aeiou]/i.test(char)) {
      let firstChars = reversedWord.slice(0, idx).join('');
      let lastChars = reversedWord.slice(idx + 1).join('');
      newString += firstChars
      newString += lastChars
      break;
    }
  }

  return [...newString].reverse().join('');
}

console.log(removeVowel('miserably'))

function removeLastVowel(sentence) {
  let words = sentence.split(' ')
  return words.map(word => {
    if (/[aeiou]/ig.test(word)) {
      return removeVowel(word);
    } else {
      return word;
    }
  }).join(' ');
}

console.log(removeLastVowel('aeiou'))
console.log(removeLastVowel("")) // ''
console.log(removeLastVowel("Myth")) // "Myth"
console.log(removeLastVowel("Hello myth")) // "Hell myth"
console.log(removeLastVowel("ThosE whO dare")) // "Thos wh dar"
console.log(removeLastVowel("Those who dare to fail miserably can achieve greatly."))
// // ➞ "Thos wh dar t fal miserbly cn achiev gretly."
console.log(removeLastVowel("Love is a serious mental disease."))
// // ➞ "Lov s  serios mentl diseas"
console.log(removeLastVowel("Get busy living or get busy dying."))
// // ➞ "Gt bsy livng r gt bsy dyng"


// Sean's Solution

function removeLastVowel(string) {
  if (string === '') return '';
  let wordsArray = string.split(' ');

  let mutatedWords = wordsArray.map(word => {
    let splitWord = word.split('');
    let index = splitWord.findLastIndex(char => {
      if (/[aeiou]/i.test(char)) return true;
    })
    if (index !== -1) {
      splitWord.splice(index, 1)
    }
    return splitWord.join('')
  })
  return mutatedWords.join(' ');
}

// Greg's Solution

function removeLastWordsVowel(word) {
  return word.split('')
             .reverse()
             .join('')
             .replace(/[aeiou]/i, '')
             .split('')
             .reverse()
             .join('');
}

function removeLastVowel(sentence) {
   let reversed = sentence.split(' ').map(removeLastWordsVowel).join(' ');
   return reversed.replace(/\s+/g, ' ');
}

console.log(removeLastVowel(''));// -> ""
console.log(removeLastVowel('AEIOU'));// -> 'AEIO'
console.log(removeLastVowel("this is just a test"));//  "ths s jst tst"
console.log(removeLastVowel("thrgh"));//  "ths s jst tst"
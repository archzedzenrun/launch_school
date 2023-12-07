/*
Headline Hash Tags
https://edabit.com/challenge/ABiF6EsqRYMvogcgp

Time Taken 30:00

Input: String
Output: Array of hashtag strings

Rules:
-Find the top the longest words of the input string
-Transform them into hashtags
-If more than 1 word has the same length, retreive the one that occurs first in the string
-Only alphabetic chars count toward word length
-If there ae less than 3 words in the string, order them by length from longest to shortest

Implicit Rules/Questions:
-Will string ever be empty?
-Will there ever be less or more arguments passed to the function?
-Do non alpha chars count toward word length?
-Punctuation doesnt count toward length but should it still appear in the hashtag words?

Examples:
'Launch School is the best!'
6, 6, 2, 3, 4
'#Launch', '#School', '#best!

'Launch School'
6, 6
'#Launch' '#School'

'Hello there world'
5, 5, 5
'#Hello there world'

'Hello'

#Hello

'' -> []

Data Structure:
Array - iteration, output

Algorithm:
-Split the input string into an array of words
-Sort the words by length from longest to shortest
  -Ignore non alphanumeric characters when sorting
-Retreive the 3 longest words
-Transform each word by prepending a hashtag char and lowercasing the word
*/

function getHashTags(headline) {
  let words = headline.split(' ');
  let sortedWords = words.sort((word1, word2) => {
    return word2.replace(/[^a-z0-9]/ig, '').length - word1.replace(/[^a-z0-9]/ig, '').length
  })
  return sortedWords.slice(0, 3).map(word => '#' + word.toLowerCase());
}

console.log(getHashTags('Launch School is the best')); // [#Launch #School #Best]
console.log(getHashTags('Launch School')); // ['#Launch' '#School']
console.log(getHashTags('Hello there world')); // ['#Hello, #there, #world']
console.log(getHashTags('Hello')); // ['#Hello']
console.log(getHashTags('')); // []

console.log(getHashTags("How the Avocado Became the Fruit of the Global Trade"));
// ["#avocado", "#became", "#global"]

console.log(getHashTags("Why You Will Probably Pay More for Your Christmas Tree This Year"));
// ["#christmas", "#probably", "#will"]

console.log(getHashTags("Hey Parents, Surprise, Fruit Juice Is Not Fruit"));
// ["#surprise", "#parents", "#fruit"]

console.log(getHashTags("Visualizing Science"));
// ["#visualizing", "#science"]
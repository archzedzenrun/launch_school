/*
https://edabit.com/challenge/Q7foiyejfJG6pqqws
TIME TAKEN: 47:00

Write a function that divides a phrase into word buckets, with each bucket containing n or fewer characters. Only include full words inside each bucket.

Input: String, Integer
Output: Array of strings

Rules:
-integer argument will be 1 or greater
-string will be alphabetic chars and spaces

Questions:


Examples:
"so that the last element is equal to the next first", 4
"so" "that" "the" "last" "is" "to" "the" "next"

bucketize("so that the last element", 7) // ["so that", "the", "last", "element"]
bucketize("three blind mice", 3) // []

bucketize("If the are any conti to the next subar in the input", 7)
// ["If the", "are any", "conti", "to the", "next", "subar", "in the", "input"]

[so, that, the, last, element]

Algorithm:
-Create a results variable to an empty array // []
-Create a temp variable to an empty array // [so, that]
-Split the input string into an array of words // [so, that, the, last, element]
-Iterate through the words array
  - Join temp array into a string // "so that" -> 7
    - Check if the length plus the length of the current word is greater than the input num // 7 + 3 ('the') > 8 ?
    - If it is: push temp to results, reset temp, push current word to temp
    - If its not: push current word to temp
-Return results
*/

function bucketize(string, size) {
  if (string.split(' ').some(word => word.length > size)) return [];

  let results = [];
  let temp = [];
  string.split(' ').forEach(word => {
    if ((temp.join(' ').length + word.length + 1) > size) { // 5 + to (2) = 7
      results.push(temp.join(' '));
      temp = [];
      temp.push(word);
    } else {
      temp.push(word);
    }
  })

  if (temp.length !== 0) results.push(temp.join(' '));
  return results;
}

// console.log(bucketize("If the are any conti to the next subar in the input", 7))
// ["If the", "are any", "conti", "to the", "next", "subar", "in the", "input"]

console.log(bucketize("she sells sea shells by the sea", 2)); // [])
console.log(bucketize("ab bc cd", 1)); // [])
// console.log(bucketize("she sells sea shells by the sea", 10)); // ["she sells", "sea shells", "by the sea"])
// console.log(bucketize("the mouse jumped over the cheese", 7)); // ["the", "mouse", "jumped", "over", "the", "cheese"])
// console.log(bucketize("fairy dust coated the air", 20)); // ["fairy dust coated", "the air"])
// console.log(bucketize("do the hokey pokey", 6)); // ["do the", "hokey", "pokey"])
// console.log(bucketize("do the hokey pokey", 12)); // ["do the hokey", "pokey"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 12)); // ["rich", "magnificent", "trees dotted", "the", "landscape"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 15)); // ["rich", "magnificent", "trees dotted", "the landscape"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 18)); // ["rich magnificent", "trees dotted the", "landscape"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 22)); // ["rich magnificent trees", "dotted the landscape"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 40)); // ["rich magnificent trees dotted the", "landscape"])
// console.log(bucketize("rich magnificent trees dotted the landscape", 43)); // ["rich magnificent trees dotted the landscape"])
// console.log(bucketize("beep bo bee bop bee bo bo bop", 6)); // ["beep", "bo bee", "bop", "bee bo", "bo bop"])
// console.log(bucketize("beep bo bee bop bee bo bo bop", 10)); // ["beep bo", "bee bop", "bee bo bo", "bop"])
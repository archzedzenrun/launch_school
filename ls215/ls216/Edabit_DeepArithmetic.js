/*
https://edabit.com/challenge/E8WcotHKRGfYodchW
TIME TAKEN: 29:00 but missed some edge cases

Write a function that takes an array of strings of arbitrary dimensionality ([], [][], [][][], etc.) and returns the sum of every separate number in each string in the array.

Input: Array
Output: Integer

Rules:
-Input array can contain strings and other arrays
-Strings can contain alphabetic chars, numbers
-Strings could contain -, - precending numbers counts as negative numbers
-String sums will be integers

Questions:
-

Examples:
['a1b2c3'] // 6
[] // 0
['a1b2c3', []] // 6
['a1b2', ['a1b2']] // 6
[['a1b2c3'], ['e4f5']] // 15
[['a-1b-2c3], 'e4f-5g8']] // 7

Data Structure:
Arrays

Algorithm: [['a1b2c3'], ['e4f5']]
-Flatten the input array into a 1 dimensional array ['a1b2c3', 'e4f5']
-Iterate through the array
  -Transform string into number:
  -Replace non numbers and '-' with ',' // ',1,2,3'
  -Split at ','
  -Filter out empty strings
  -Transform each string into a number
  -Find the sum of the split numbers
-Find the total sum of the array and return it
*/

// function formatNumber(string) {
//   return string.split(',').filter(num => num !== '' || num !== '-')
// }

function sum(array) {
  array = array.flat(Infinity);
  return array.map(string => {
    string = string.replace(/[^0-9-]/gi, ',')

    return string = string.split(',').filter(num => num !== '' || num !== '-');

    return string.reduce((sum, num) => sum + num, 0);
  })//.reduce((sum, num) => sum + num, 0);
}

// console.log(sum(['a1b2c3'])) // 6
// console.log(sum([])) // 0
// console.log(sum(['a1b2c3', []])) // 6
// console.log(sum(['a1b2', ['a1b2']])) // 6
// console.log(sum([['a1b2c3'], ['e4f5']])) // 15
// console.log(sum([['a-1b-2c3'], 'e4f-5g8'])) // 7
// console.log(sum(["1", "five", "2wenty-one", "thr33"])); // 36
// console.log(sum([["1X2", "t3n"],["1024", "5", "64"]])); //1099
// console.log(sum([[[[[[[[[[[[[[[["-1", "1"], ["3"], [""], []]]]]]]]]]]]]]]])); // 3
// console.log(sum([[["0", "0x2", "z3r1"],["1", "55a46"]],[["1", "0b2", "4"],["0x5fp-2", "nine", "09"],["4", "4", "4"]],[["03"]], []])); //142
console.log(sum([[[[[["-32-64", "a-zA-Z"], ["01-1"]]]]]])); // -96
// console.log(sum([[[[[[[[[[[[[[[["-1", "1"], ["3"], [""], []]]]]]]]]]]]]]]])); // 3


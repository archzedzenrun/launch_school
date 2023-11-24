/*
Input: String with one or more ranges of numbers
Output: String

Notes:
-Each number is an increasing number

-If number is less than previous number
  -Prepend an increasing number starting at 1 until the current number is greater than the previous number

Rules:
-We are given a range of numbers separated by "-" ":" or ".."

Examples:

    "1, 3, 7, 2, 4, 1" --> 1, 3, 7, 12, 14, 21


    "1-3, 1-2" --> 1, 2, 3, 11, 12

    ['1-3', '1-2']
    [['1', '2', '3'], ['1', '2']]
    [1, 2, 3, 1, 2]



    "1:5:2" --> 1, 2, 3, 4, 5, 6, ... 12

    ['1:5:2']
    [['1'], ['5'], ['2']]
    [1, 5, 2]


    "104-2" --> 104, 105, ... 112

    [['104'], ['2']]

    ['104', '2']


    [104, 2]
    12, 22, 32, 42, 52, 62, 72, 82, 92, 102, 112
    [104, 112]


    "104-02" --> 104, 105, ... 202


    "545, 64:11" --> 545, 564, 565, .. 611
    ['545', '64:11']
    [['545'], ['64', '11']]

    if there are more than 1 subarrays after splitting at space
    iterate through the sub arrays, check if first number of current sub array is greater than the last number at the previous sub array, if it isnt, adjust it.

    [['545'], ['564', '11']]



    "1-3, 1-5"

    [[1-3], [1-5]]
    [[1, 2, 3], [1, 2, 3, 4, 5]]


Data Structure:
Array to hold number digits

Algorithm:
Helper function to incrememnt the value of number:
-Input: Number as a string, Target number as a string
-Start by appending a 1 to the first argument
-Increment the value of the first digit by 1 until the number is greater than the target argument.

Helper function to adjust numbers:
-Iterate over the array of range sub arrays starting at the second sub array
  -Check if the first number of current sub array is less than the last number of the previous sub array
  -If it is, use the increment helper function to adjust the number
-Return the array of range subarrays

Helper function to adjust range numbers:
Input: Array
-Iterate through the input array starting at the second number
  -If current number is less than previous number
    -Increment the number using the incrementNum helper function

Helper function to populate range:
Input: Array
-Create a numberRange variable as an empty array
-Iterate from the first number of the input to the last
  -On each iteration add the current number to the numberRange variable as a string.
-Return the numberRange array

Main function:
-Split the input string at spaces.
-Transform each split string into sub arrays by splitting at valid delmiters (.. - :)

-If the number of sub arrays is greater than 1
  -Use the adjust helper function to adjust the numbers.

-Iterate through the ranges array
  -Iterate through the numbers of each range subarray
  -Transform values by passing them to the adjustRangeNumbers function

-Iterate through the ranges array again
  -This time transform each range subarray into a range of numbers by passing the sub array to the populate range helper function.

-Join all sub arrays into one array and return a string with numbers separated by ,
*/

function incrementNum(num, target) {
  let incrementer = 0;
  let incrementedNum;
  do {
    incrementer += 1;
    incrementedNum = String(incrementer) + num;
  } while (Number(incrementedNum) < Number(target))

  return incrementedNum;
}

function adjustRangeArrays(rangeArrays) {
  for (let idx = 1; idx < rangeArrays.length; idx += 1) {
    let previousRange = rangeArrays[idx - 1];
    let lastNumOfPreviousRange = previousRange[previousRange.length - 1];
    let currentNum = rangeArrays[idx][0];
    if (Number(currentNum) < Number(lastNumOfPreviousRange)) {
      rangeArrays[idx][0] = incrementNum(currentNum, lastNumOfPreviousRange);
    }
  }

  return rangeArrays
}

function populateRange(rangeArray) {
  let rangeOfNumbers = [];
  let firstNum = Number(rangeArray[0]);
  let lastNum = Number(rangeArray[rangeArray.length - 1]);
  for (let currentNum = firstNum; currentNum <= lastNum; currentNum += 1) {
    rangeOfNumbers.push(currentNum);
  }

  return rangeOfNumbers
}

function adjustRangeNumbers(rangeArray) {
  for (let idx = 1; idx < rangeArray.length; idx += 1) {
    let currentNum = rangeArray[idx];
    let previousNum = rangeArray[idx - 1];
    if (Number(currentNum) < Number(previousNum)) {
      rangeArray[idx] = incrementNum(currentNum, previousNum);
    }
  }

  return rangeArray;
}

function createRange(rangeString) {
  let rangeArrays = rangeString.split(', ').map(range => {
    return range.split(/\.\.|-|:/)
  });

  if (rangeArrays.length > 1) {
    rangeArrays = adjustRangeArrays(rangeArrays);
  }

  rangeArrays = rangeArrays.map(range => {
    if (range.length > 1) {
      return adjustRangeNumbers(range);
    } else {
      return range;
    }
  });

  rangeArrays = rangeArrays.map(range => populateRange(range));
  return rangeArrays.flat().join(', ');
}

console.log(createRange("1, 3, 7, 2, 4, 1"));
console.log(createRange("1-3, 1-2"));
console.log(createRange('1-3, 1-2:5'));
console.log(createRange("1:5:2" ));
console.log(createRange("104-2"));
console.log(createRange("104-02"));
console.log(createRange("545, 64:11" ));
console.log(createRange("1-3, 1-5"));
console.log(createRange("1..3, 1..5"));
console.log(createRange("1..3..5"));
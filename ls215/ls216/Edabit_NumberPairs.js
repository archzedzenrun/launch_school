/*
Number Pairs
https://edabit.com/challenge/fpHGmHoKX5RyD3wjQ
TIME TAKEN: 22:00

Create a function that determines how many number pairs are embedded in a space-separated string. The first numeric value in the space-separated string represents the count of the numbers, thus, excluded in the pairings.

Input: String
Output: Integer representing number of pairs

Rules:
-Excluding the first number in the string, find the count of number pairs in the string

Implicit Rules/Questions:
-Will there ever be less or more than 1 arguments passed? -> No
-Will the input string ever be empty? -> Possibly
-Does the first number ALWAYS represent the count of numbers? -> Yes
-Will the argument always be a string type? -> Yes
-Will the string ever contain anything other than positive integers? -> No

Examples:
number_pairs("") // 0
number_pairs("7 1 2 1 2 1 3 2") // 2
number_pairs("7") // 0
number_pairs("7 7") // 0
number_pairs("7 7 7") // 1

number_pairs("7 1 2 1 2 1 3 2")
{ 1: 3, 2: 3, 3: 1 }


Data Structure:
Input: String
Intermediate: Array for iteration, Object to store numbers/counts
Output: Integer

Algorithm:
-Create a count variable (0)
-Create a counts variable (empty object)
-Split the input string into an array
-Iterate through the array
-On each iteration:
  -Check if current num exists as a property in the counts object
  -If it does, increment the value by 1
  -Otherwise set the value to 1
-Iterate through the values of the count object
  -Divide the value by 2
    -Increment count by the result
-Return the value of count
*/

function number_pairs(numString) {
  let pairCount = 0;
  let counts = {};

  let splitNums = numString.split(' ');
  splitNums.shift();
  splitNums.forEach(num => {
    counts[num] ? counts[num] += 1 : counts[num] = 1;
  })

  Object.values(counts).forEach(count => {
    pairCount += (Math.floor(count / 2));
  });

  return pairCount;
}

console.log(number_pairs("")); // 0
console.log(number_pairs("7 1 2 1 2 1 3 2")); // 2
console.log(number_pairs("7")); // 0
console.log(number_pairs("7 7")); // 0
console.log(number_pairs("7 7 7")); // 1
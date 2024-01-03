/*
https://edabit.com/challenge/yX8HRSfdHjKji8ikf
TIME TAKEN 42:00
Didnt pass one edge case

A ship has to transport cargo from one place to another, while picking up cargo along the way. Given the total amount of cargo and the types of cargo holds in the ship as arrays, create a function that returns true if each weight of cargo can fit in one hold, and false if it can't.

"S" means 50 cargo space.
"M" means 100 cargo space.
"L" means 200 cargo space.

Input: Array of integers (total amount of cargo)
Output: Boolean

Rules:
-Check if each cargo amount can fit in one cargo hold
-Return true/false

-Only 2 array arguments passed
-Neither input will be empty array
-arrays could be different sizes
-each hold can hold multiple amounts of cargo

Questions:
-

Examples:
willFit(['S', 'L', 'M'], [125, 40, 75]) // true
[50, 200, 100], [123, 40, 75]

[50, 100, 200], 350


[200, 200, 200, 200], 708

willFit(['S', 'M', 'L'], [50, 100, 200]) // true
willFit(['S', 'L', 'M'], [125, 40, 75]) // true
willFit(['S', 'M'], [50, 100, 200]) // false
willFit(['S'], [50, 100]) // false
willFit(['S', 'M'], [50, 50]) // true
willFit(['L'], [100, 100] // true
willFit(['S', 'S'], [100]) // false
willFit(["L", "L", "L", "L"], [54, 54, 200, 200, 200]) // true, "54 and 54 can fit in one hold.")
willFit(['L'], [50, 50, 50, 50]) // true
willFit(["L", "L", "M"], [56, 62, 84, 90]) // true
willFit(["S", "S", "S"], [10, 10, 90]) // false


Data Structure:
Arrays

Algorithm:
-Transform first array strings into numbers
-Check if any numbers in the second array are larger than the largest number in the first array
  -If so, return false

-Find the sum of both arrays
-Subtract sum of first array from sum of second array
-Return true if difference is 0 or greater

https://edabit.com/challenge/yX8HRSfdHjKji8ikf

*/

function willFit(holds, amounts) {
  holds = holds.map(hold => {
    if (hold === 'S') {
      return 50;
    } else if (hold === 'M') {
      return 100;
    } else {
      return 200;
    }
  })

  if (amounts.some(amount => amount > Math.max(...holds))) return false;

  let holdSums = holds.reduce((total, num) => total + num);
  let amountsSum = amounts.reduce((total, num) => total + num);

  return amountsSum - holdSums <= 0
}

console.log(willFit(['S', 'M', 'L'], [50, 100, 200])); // true
console.log(willFit(['S', 'L', 'M'], [125, 40, 75])); // true
console.log(willFit(['S', 'M'], [50, 100, 200])); // false
console.log(willFit(['S'], [50, 100])); // false
console.log(willFit(['S', 'M'], [50, 50])); // true
console.log(willFit(['L'], [100, 100])); // true
console.log(willFit(['S', 'S'], [100])); // false
console.log(willFit(["L", "L", "L", "L"], [54, 54, 200, 200, 200])); // true, "54 and 54 can fit in one hold.")
console.log(willFit(['L'], [50, 50, 50, 50])); // true
console.log(willFit(["L", "L", "M"], [56, 62, 84, 90])); // true
console.log(willFit(["S", "S", "S"], [10, 10, 90])); // false
console.log(willFit(["S", "S", "L"], [10, 55, 199])); // false

console.log(willFit(["M", "L", "L", "M"], [56, 62, 84, 90]), true)
console.log(willFit(["L", "L", "M"], [56, 62, 84, 90]), true)
console.log(willFit(["S", "S", "S", "S", "L"], [40, 50, 60, 70 , 80, 90, 200]), false)
console.log(willFit(["S", "L"], [73 , 87, 95, 229]), false)
console.log(willFit(["L", "L", "L", "L"], [54, 54, 200, 200, 200]), true, "54 and 54 can fit in one hold.")
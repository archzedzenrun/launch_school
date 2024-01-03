/*
https://edabit.com/challenge/7DiEaqrnap9DDXnSo
TIME TAKEN: 24:00

You want to introduce a discount for your online store. Every customer gets a 25% discount on the most expensive item in the shopping cart. The discount will be calculated on just one item, even if the customer buys more than one of the most expensive item.

Create a function that takes an object and returns the total price after discount.

Input: Array of objects
Output: Number (decimal to two places)

Rules:
-Calculate the sum of every item in the input based on the quantity for each item
-The most expensive item gets a 25% discount
-Return 0 if array is empty
-To calculate 25% off, multiply most expensive item by .25 and subtract the result from the original numbe

Questions:
-Will there always be 1 arg? -> Yes
-Will the arg always be an array? -> Yes
-Will the array ever be empty? -> Possibly
-Will the price and quantity value always be an integer? -> Yes
-Can the shopping cart be any size? -> Yes

Examples
console.log(twentyFiveOnOne([
  { name: "Nokia 9250", quantity: 3, price: 800 },])) 2200.00

console.log(twentyFiveOnOne([
  { name: "Iphone 20x", quantity: 1, price: 1350 },
  { name: "Samsung x30", quantity: 1, price: 1225 },
  { name: "Nokia 9250", quantity: 1, price: 800 },])) // 2362.50

twentyFiveOnOne([]) // []
twentyFiveOnOne([
  { name: "Iphone 20x", quantity: 1, price: 1350 },
  { name: "Samsung x30", quantity: 1, price: 1225 },
  { name: "Nokia 9250", quantity: 1, price: 800 },
  { name: "Tesla Model Y", quantity: 1, price: 72999 }
]) ➞ 58124.25

twentyFiveOnOne([
  { name: "jogging pants", quantity: 1, price: 29.99 },
  { name: "tennis socks", quantity: 2, price: 5.99 },
  { name: "sweat shirt", quantity: 1, price: 59.99 }
]) ➞ 86.96

Notes

The total returned price is calculated upon two decimals.

Data Structure:
Arrays - input/iteration
objects

Algorithm:
-Create a results var to an empty array
-Find the largest priced item in the input array
  -Map input array to the price
  -Find the largest price
  -Apply 25% discount to the largest price and push to results

-Iterate through the input array
  -Check if price of current object is equal to largest price
  -If it is: subtract 1 from the quanitity of current object
  -Push price * quantity to results array

-Find the sum of results array and round to 2 decimal places
-Return the result
*/

// function twentyFiveOnOne(cart) {
//   let results = [];
//   let largestPrice = Math.max(...cart.map(item => item.price));
//   results.push(largestPrice - (largestPrice * .25));
//   cart.forEach(item => {
//     if (item.price === largestPrice) {
//       results.push((item.quantity - 1) * item.price);
//     } else {
//       results.push(item.quantity * item.price);
//     }
//   })

//   let sum = results.reduce((total, num) => total + num, 0);
//   return Number(sum.toFixed(2));
// }

// Refactored:

function twentyFiveOnOne(cart) {
  let largestPrice = Math.max(...cart.map(item => item.price));
  let total = largestPrice - (largestPrice * .25);
  cart.forEach(item => {
    if (item.price === largestPrice) item.quantity -= 1;
    total += (item.quantity * item.price);
  })

  return Number(total.toFixed(2));
}


console.log(twentyFiveOnOne([
  { name: "Nokia 9250", quantity: 3, price: 800 },])); //2200.00

console.log(twentyFiveOnOne([
  { name: "Iphone 20x", quantity: 1, price: 1350 },
  { name: "Samsung x30", quantity: 1, price: 1225 },
  { name: "Nokia 9250", quantity: 1, price: 800 },])); // 2362.50

console.log(twentyFiveOnOne([])); // []
console.log(twentyFiveOnOne([
  { name: "Iphone 20x", quantity: 1, price: 1350 },
  { name: "Samsung x30", quantity: 1, price: 1225 },
  { name: "Nokia 9250", quantity: 1, price: 800 },
  { name: "Tesla Model Y", quantity: 1, price: 72999 }
])); // 58124.25

console.log(twentyFiveOnOne([
  { name: "jogging pants", quantity: 1, price: 29.99 },
  { name: "tennis socks", quantity: 2, price: 5.99 },
  { name: "sweat shirt", quantity: 1, price: 59.99 }
])); // 86.96
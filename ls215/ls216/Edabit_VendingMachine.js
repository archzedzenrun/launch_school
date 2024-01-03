/*
https://edabit.com/challenge/PYXbvQh9W3c9i72xx
TIME TAKEN: 42:00

Your task is to create a function that simulates a vending machine.

Given an amount of money (in cents ¢ to make it simpler) and a productNumber, the vending machine should output the correct product name and give back the correct amount of change.

The coins used for the change are the following: [500, 200, 100, 50, 20, 10]

The return value is an object with 2 properties:

product: the product name that the user selected.
change: an array of coins (can be empty, must be sorted in descending order).

vendingMachine(products, 200, 7) ➞ { product: "Crackers", change: [ 50, 20, 10 ] }

Input: Array of products (object), money (integer), productNumber (integer)
Output: Object with product name and change properties (change value is array)

Rules:
-products array and everything in it will not change
-Return 'not enough money for this product' if you cant afford the product (second arg less than the price of the product)
-[500, 200, 100, 50, 20, 10] - coins used for change

Questions:
-Second arg always integer? -> Yes, integer greater than 0
-Third arg will always be integer 1-9? -> Yes
-Can use multiple of the same coin for change? -> No, use the largest coin you can

Examples:
Money 500
Price 120

380 -> [200, 100, 50, 20, 10]

Data Structure/Algorithm:
-Create a coins var to [500, 200, 100, 50, 20, 10]

-Create a result var with an object containing product key and the name of the product id as a value, and a change key with empty array as value

{ product: "Crackers", change: [] }

Find the amount of change needed by finding the price of the given product id and subtracting that from the second arg (money) // 380

-Iterate through the coins array
  -Check if current coin is less than changeNeeded 500 < 380 ? No
  -If it is
    -Push current coin to results
    -reassign changeNeeded to the difference of the current coin and changeNeeded // 200 < 380 ? Yes

-Return results
*/
function getProduct(products, num) {
  for (let i = 0; i < products.length; i += 1) {
    if (products[i].number === num) {
      return products[i];
    }
  }
}

function vendingMachine(products, money, productNum) {
  if (/[^1-9]/.test(productNum)) return 'Enter a valid product number';
  let productInfo = getProduct(products, productNum);
  if (productInfo.price > money) return 'not enough money for this product';
  let coins = [500, 200, 100, 50, 20, 10];
  let results = { product: productInfo.name, change: [] }
  let changeNeeded = money - productInfo.price;
  for (let i = 0; i < coins.length; i += 1) {
    let currentCoin = coins[i]
    if (currentCoin <= changeNeeded) {
      results.change.push(currentCoin);
      changeNeeded -= currentCoin;
    }
  }

  // if (changeNeeded !== 0) {
  //   results.change.push(changeNeeded);
  // }

  return results;
}

//////////

// Trish solution

// function vendingMachine(products, money, productNum) {
//   if (productNum < 1 || productNum > 9) return "Enter valid product number";

//   let result = {};
//   let item = products.find(prod => prod.number === productNum);
//   result.product = item.name;

//   let change = money - item.price;
//   if (change < 0) return "Not enough money for this product"
//   result.change = [];

//   const coins = [500, 200, 100, 50, 20, 10];
//   coins.forEach(coin => {
//     if (change >= coin) {
//       result.change.push(coin);
//       change = change - coin
//     }
//   })

//   return result;
// }

const products = [
  { number: 1, price: 100, name: 'Orange juice' },
  { number: 2, price: 200, name: 'Soda' },
  { number: 3, price: 150, name: 'Chocolate snack' },
  { number: 4, price: 250, name: 'Cookies' },
  { number: 5, price: 180, name: 'Gummy bears' },
  { number: 6, price: 500, name: 'Condoms' },
  { number: 7, price: 120, name: 'Crackers' },
  { number: 8, price: 220, name: 'Potato chips' },
  { number: 9, price: 80,  name: 'Small snack' },
];

// console.log(vendingMachine(products, 200, 7)); // { product: "Crackers", change: [ 50, 20, 10 ] }

// console.log(vendingMachine(products, 500, 0)); // "Enter a valid product number"

// console.log(vendingMachine(products, 90, 1)); // "Not enough money for this product"
// console.log(vendingMachine(products, 500, 8)); // { product: 'Potato chips', change: [ 200, 50, 20, 10 ] });

console.log(vendingMachine(products, 500, 8)); // { product: 'Potato chips', change: [ 200, 50, 20, 10 ] }
console.log(vendingMachine(products, 500, 1)); // { product: 'Orange juice', change: [ 200, 200 ] });
console.log(vendingMachine(products, 200, 7)); // { product: 'Crackers', change: [ 50, 20, 10 ] });
console.log(vendingMachine(products, 100, 9)); // { product: 'Small snack', change: [ 20 ] });
console.log(vendingMachine(products, 1000, 6)); // { product: 'Condoms', change: [ 500 ] });
console.log(vendingMachine(products, 250, 4)); // { product: 'Cookies', change: [] });
console.log(vendingMachine(products, 90, 1)); // 'Not enough money for this product');
console.log(vendingMachine(products, 0, 0)); // 'Enter a valid product number');

// const products = [
//   { number: 1, price: 100, name: 'Orange juice' },
//   { number: 2, price: 200, name: 'Soda' },
//   { number: 3, price: 150, name: 'Chocolate snack' },
//   { number: 4, price: 250, name: 'Cookies' },
//   { number: 5, price: 180, name: 'Gummy bears' },
//   { number: 6, price: 500, name: 'Condoms' },
//   { number: 7, price: 120, name: 'Crackers' },
//   { number: 8, price: 220, name: 'Potato chips' },
//   { number: 9, price: 80,  name: 'Small snack' },
// ];

console.log(vendingMachine(products, 500, 7)) //➞ { product: "Crackers", change: [200, 100, 50, 20, 10] }
// console.log(vendingMachine(products, 200, 6)) //➞ 'not enough money for this product'
console.log(vendingMachine(products, 200, 7)) //➞ { product: "Crackers", change: [ 50, 20, 10 ] }

console.log(vendingMachine(products, 500, 8)); // { product: 'Potato chips', change: [ 200, 50, 20, 10 ] }
console.log(vendingMachine(products, 500, 1)); // { product: 'Orange juice', change: [ 200, 200 ] });
console.log(vendingMachine(products, 200, 7)); // { product: 'Crackers', change: [ 50, 20, 10 ] });
console.log(vendingMachine(products, 100, 9)); // { product: 'Small snack', change: [ 20 ] });
console.log(vendingMachine(products, 1000, 6)); // { product: 'Condoms', change: [ 500 ] });
console.log(vendingMachine(products, 250, 4)); // { product: 'Cookies', change: [] });
console.log(vendingMachine(products, 90, 1)); // 'Not enough money for this product');
console.log(vendingMachine(products, 0, 0)); // 'Enter a valid product number');
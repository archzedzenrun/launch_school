/*
https://edabit.com/challenge/FrFkH5BPnqz4pYpqD
TIME TAKEN: 18:00

You bought a few bunches of fruit over the weekend. Create a function that splits a bunch into singular objects inside an array.

Input: Array of objects
Output: Array of objects

Rules:
-Splitting each object in the input into as many copies as the quantity for that object
-Order output same as objects appear in input

Questions:
-Less/more than 1 arg? -> No
-Arg always array? -> Yes
-Array ever empty? -> No
-Array any size? -> Yes
-Object will only contain keys name and quantity? -> Yes
-Name will be string, quantity will be integer? -> Yes
-Quantity will always be greater than 0? -> Yes

-Can there be duplicate names?
-Always splitting into quantities of one?
-How should they be ordered?


console.log(splitBunches([ { name: "grapes", quantity: 3 }, { name: "bananas", quantity: 2 }])) // [{ name: "grapes", quantity: 1 }, { name: "grapes", quantity: 1 }, { name: "grapes", quantity: 1 }, { name: "bananas", quantity: 1 }, { name: "bananas", quantity: 1 }]

console.log(splitBunches([
  { name: "grapes", quantity: 2 }
])) // ➞ [
  { name: "grapes", quantity: 1 },
  { name: "grapes", quantity: 1 }
]

Data Structure:
Arrays, Objects

Algorithm:
-Create a results variable to an empty array
-Iterate through the input array
  -For as many times as the quantity:
  -Push the current object with its name and quantity of 1 to results array
-Return results
*/

function splitBunches(fruits) {
  return fruits.reduce((results, fruit) => {
    let count = fruit.quantity;
    fruit.quantity = 1;
    for (let num = 0; num < count; num += 1) {
      results.push(fruit);
    }

    return results;
  }, [])
}


// had to finish it! ^^' just checking if it works ^^' Nice! ^^' Def not as pretty though :p I'll work on reduce later. Bai! See ya!
// function splitBunches(arr) {
//   let results = [];
//   arr.forEach(obj => {
//     if (obj.quantity === 1) {
//       results.push(obj);
//     } else {
//       let n = obj.quantity;
//       obj.quantity = 1;
//       while (n >= 1) {
//         results.push(obj);
//         n --;
//       }
//     }
//   })

//   return results;
// }

console.log(splitBunches([ { name: "grapes", quantity: 3 }, { name: "bananas", quantity: 2 }])) // [{ name: "grapes", quantity: 1 }, { name: "grapes", quantity: 1 }, { name: "grapes", quantity: 1 }, { name: "bananas", quantity: 1 }, { name: "bananas", quantity: 1 }]

console.log(splitBunches([
  { name: "grapes", quantity: 2 }
])) // ➞ [
  //{ name: "grapes", quantity: 1 },
  //{ name: "grapes", quantity: 1 }
//]

console.log(splitBunches([{ name: "cherry", quantity: 2 }, { name: "orange", quantity: 1 }, { name: "cherry", quantity: 2 } ])) // [ { name: "cherry", quantity: 1 }, { name: "cherry", quantity: 1 }, { name: "orange", quantity: 1 }, { name: "cherry", quantity: 1 }, { name: "cherry", quantity: 1 }]
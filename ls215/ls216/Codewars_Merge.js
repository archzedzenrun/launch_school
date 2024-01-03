// https://www.codewars.com/kata/56bd9e4b0d0b64eaf5000819/javascript
// TIME TAKEN: 28:00
// FAIL, MISSED RULE ABOUT 2 OR MORE ARGS

// Write a function that takes two or more objects and returns
// a new object which combines all the input objects.

// Objects are combined together so that the values of matching keys are added together.

// An example:

// const objA = { a: 10, b: 20, c: 30 }
// const objB = { a: 3, c: 6, d: 3 }
// combine(objA, objB) // Returns { a: 13, b: 20, c: 36, d: 3 }

// The combine function should not mutate the input objects.

/*
Input: 2 objects
Output: Single object combining both inputs

Rules:
-If a key is present in both objects, add the values together
-Do not mutate the inputs

Questions:
-Less or more than 2 arguments? -> No
-Will both arguments always be objects? -> Yes
-Will either arg ever be empty object? -> Possibly
-Could both be empty? -> Yes
-Will the values always be integers? -> Yes
-Can the objects be any size? -> Yes
-Will the objects always be the same size? -> No
-Should output be in a particular order? -> keys from arg1 first

Data Structure:
Array for iteration?
Objects

Algorithm:
-Create a results var to an empty object
-Turn second arg into an array of entries
-Iterate through entries of first arg
  -Check if current key is present in second arg by filtering out anything else
  -If it is, add the two values together and push the key/sum to results
  -Reassign second arg to the return of filtering out the current key
-Combine results with second arg and return it
*/

// function sum(array) {
//   return array.reduce((total, entry) => total + entry[1], 0);
// }

// function combine(obj1, obj2) {
//   let results = {};
//   obj2 = Object.entries(obj2);
//   Object.entries(obj1).forEach(entry1 => {
//     let currentKey = entry1[0];
//     let currentVal = entry1[1];
//     let total = sum(obj2.filter(entry2 => entry2[0] === currentKey))
//     results[currentKey] = total + currentVal;
//     obj2 = obj2.filter(entry => entry[0] !== currentKey);
//   })

//   obj2.forEach(entry => results[entry[0]] = entry[1]);
//   return results;
// }

function combine(...args) {
  let results = {};
  let entries = args.map(arg => Object.entries(arg)).flat();
  entries.forEach(entry => {
    if (results[entry[0]]) {
      results[entry[0]] += entry[1];
    } else {
      results[entry[0]] = entry[1];
    }
  })

  return results;
}

console.log(combine({ a: 10, b: 20, c: 30 }, { a: 3, c: 6, d: 3 })) // { a: 13, b: 20, c: 36, d: 3 }
console.log(combine({ a: 10, b: 20 }, {})) // { a: 10, b: 20 }
console.log(combine({}, { a: 10, b: 2})) // { a: 10, b:2 }
console.log(combine({}, {})) // {}
console.log(combine({}, { b: 2})) // { b:2 }
console.log(combine({ b: 10 }, { b: 2 })) // { b: 12 }
console.log(combine({ b: 10 }, { b: 2, a: 5 })) // { b: 12, a: 5 }

const obj1 = { a: 1, b: 2 }
const obj2 = { b: 4, d: 1 }
const obj3 = { b: 4, c: 3, d: 3 }
console.log(combine(obj1, obj2, obj3)); // { a: 1, b: 10, c: 3, d: 4}


// Trish solution (way better)

// function combine(...args) {
//   let result = {};
//   args.map(obj => Object.entries(obj)).flat().forEach(entry => {
//     console.log(entry)
//     let prop = entry[0];
//     let val = entry[1];
//     Object.keys(result).includes(prop) ? result[prop] += val : result[prop] = val;
//   });

//   return result;
// }
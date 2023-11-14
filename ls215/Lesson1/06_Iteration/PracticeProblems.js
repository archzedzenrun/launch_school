// function myForEach(array, func) {
//   for (let index = 0; index < array.length; index += 1) {
//     func(array[index]);
//   }
// }

// let min = Infinity;
// let getMin = value => (min = value <= min ? value : min);
// myForEach([4, 5, 12, 23, 3], getMin);
// console.log(min);                        // 3

// let arr = [1, 2, 3];

// function logger(idx, num, arr) {
//   console.log(idx, num, arr);
// }

// arr.forEach(logger);

// ============================================================================

// function myFilter(array, func) {
//   let filtered = [];
//   for (let idx = 0; idx < array.length; idx += 1) {
//     if (func(array[idx])) {
//       filtered.push(array[idx]);
//     }
//   }

//   return filtered;
// }

// let isPythagoreanTriple = function (triple) {
//   return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
// };

// console.log(myFilter([{ a: 3, b: 4,  c: 5 },
//           { a: 5, b: 12, c: 13 },
//           { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));

// ============================================================================

// function myMap(array, func) {
//   let transformed = [];
//   for (let idx = 0; idx < array.length; idx += 1) {
//     transformed.push(func(array[idx]));
//   }

//   return transformed;
// }

// let plusOne = n => n + 1;
// console.log(myMap([1, 2, 3, 4], plusOne));       // [ 2, 3, 4, 5 ]

// ============================================================================

function myReduce(array, func, initial) {
  if (initial === undefined) {
    initial = array[0];
  }

  console.log(array, func, initial);
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49

// ===============================================================================

function totalArea(rectangles) {
  let areas = rectangles.map(([l, w]) => l * w);
  return areas.reduce((sum, area) => sum + area);
}

function totalSquareArea(rectangles) {
  let squares = rectangles.filter(([l, w]) => l === w);
  return totalArea(squares);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalSquareArea(rectangles));    // 121
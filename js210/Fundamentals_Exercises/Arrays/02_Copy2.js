// let myArray = [1, 2, 3, 4];
// const myOtherArray = [];

// for (let i = 0; i < myArray.length; i += 1) {
//   myOtherArray.push(myArray[i]);
// }

// myArray.pop();
// console.log(myOtherArray);

// myArray = [1, 2];
// console.log(myOtherArray);

let myArray = [1, 2, 3, 4];
const myOtherArray = myArray.slice();

myArray.pop();
console.log(myArray);               // [1, 2, 3]
console.log(myOtherArray);          // [1, 2, 3, 4]
// let myName = 'Bob';
// const saveName = myName;
// myName = 'Alice';
// console.log(myName, saveName); // Alice Bob

const myName = 'Bob';
const saveName = myName;
myName.toUpperCase();
console.log(myName, saveName); // Bob Bob

// Strings are immutable objects so the invocation of the toUpperCase method has no affect on the object it was called on (the string myName points to).

// Further Exploration: Methods can be used on primitive values because they are temporaily converted to an object of the same type, giving them access to properties and methods of that object prototype.
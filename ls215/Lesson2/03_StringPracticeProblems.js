// Exercise 1

let firstName = 'Cruz';
let lastName = 'Hernandez';
let fullName = firstName + ' ' + lastName;
console.log(fullName);

// Exercise 2

console.log(firstName.concat(lastName));

// Exercise 3

console.log(fullName.split(' '));

// Exercise 4

let language = 'JavaScript';
let idx = language.indexOf('S');
console.log(idx);

// Exercise 5

let charCode = language.charCodeAt(idx);
console.log(charCode);

// Exercise 6

console.log(String.fromCharCode(charCode));

// Exercise 7

console.log(language.lastIndexOf('a'));

// Exercise 8

let a = 'a';
let b = 'b';
console.log(a > b);
b = 'B';
console.log(a > b);

// Exercise 9

console.log(language.slice(1, 4));
console.log(language.slice(2, 4));

// Exercise 10

console.log(language.substring(1, 4));
console.log(language.substring(2, 4));

// Exercise 11

console.log(language.slice(1, -1));
console.log(language.slice(2, -1));

// Exercise 12

console.log(language.substring(1, -1));
console.log(language.substring(2, -1));

// Exercise 13

let fact1 = 'JavaScript is fun';
let fact2 = 'Kids like it too';
let compoundSentence = fact1 + ' and ' + fact2.toLowerCase();
console.log(compoundSentence);

// Exercise 14

console.log(fact1[0]);
console.log(fact2[0]);

// Exercise 15

let pi = 22 / 7;
console.log(pi.toString().lastIndexOf('14'));

// Exercise 16

// let boxNumber = 356.toString(); -- Syntax Error . is treated as a decimal instead of method separator.

let boxNumber = 356..toString();
console.log(boxNumber);
boxNumber = (356).toString();
console.log(boxNumber);

// Exercise 17

boxNumber = parseInt(boxNumber, 10);
console.log(typeof boxNumber);
boxNumber = String(boxNumber);
console.log(typeof boxNumber);

// Exercise 18

let rlSync = require('readline-sync');
let name = rlSync.question("What's your name?\n");

if (name.endsWith('!')) {
  name = name.slice(0, -1)
  console.log(`Hello ${name}. WHY ARE WE SCREAMING?`.toUpperCase());
} else {
  console.log(`Hello ${name}.`);
}
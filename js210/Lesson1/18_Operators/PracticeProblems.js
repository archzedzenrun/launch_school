let apples = 3;
let bananas = 5;
bananas = '3';

if (apples == bananas) {
  console.log('They are equal.');
}

if (apples === bananas) {
  console.log('They are equal.');
} else {
  if (apples == bananas) {
    console.log('They are the same value, different types.');
  } else {
    console.log('They are not equal.');
  }
}

// The second statement (using ===) doesn't log a message because the strict equality operator doesnt try to coerce the operands. It returns true only if both operands have the same value and are of the same type.

apples = 3;
bananas = 3;
let areEqual = (apples === bananas);
console.log(areEqual);

apples = 3;
bananas = undefined;
let eitherOr = (apples || bananas);
console.log(eitherOr);

bananas = 1;
eitherOr = (bananas || apples);
console.log(eitherOr);

let lastName = 'Hernandez'
let familyMessage = lastName === 'Hernandez' ? "You're part of the family!" : "You're not family.";

console.log(familyMessage);
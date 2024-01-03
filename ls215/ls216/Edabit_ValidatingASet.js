/*
https://edabit.com/challenge/278bzxEFeTKNiKXfM
TIME TAKEN: 34:00

// In the game Set, three cards form a set if each of the cards are identical or completely different for each of the four properties. All three cards must:

// Have the same color or different colors.
// Have the same number or different numbers.
// Have the same shades or different shades.
// Have the same shape or different shapes.
// The four properties are:

// Colors: red, purple, green
// Numbers: 1, 2, 3
// Shades: empty, lined, full
// Shapes: squiggle, oval, diamond
// Here, a set is represented by an array containing three cards. Each card is represented by an object of properties and values. Write a function that determines whether three cards constitute a valid set.

// Here is an example of a set:

// [
//   { color: "red", number: 1, shade: "empty", shape: "squiggle" },
//   { color: "red", number: 2, shade: "lined", shape: "diamond" },
//   { color: "red", number: 3, shade: "full", shape: "oval" }
// ]

// // "Same" properties: color
// // "Different" properties: numbers, shading and shapes
// The following is not a set:

// [
//   { color: "red", number: 1, shade: "empty", shape: "squiggle" },
//   { color: "red", number: 2, shade: "lined", shape: "diamond" },
//   { color: "purple", number: 3, shade: "full", shape: "oval" }
// ]

// // Colors are not all identical, but not all different.

/*

Input: Array of 3 objects
Output: Boolean

Rules:
-For 3 cards to be a set they have to:
-All 3 property values have to either be the same or completely different

Colors: red, purple, green
Numbers: 1, 2, 3
Shades: empty, lined, full
Shapes: squiggle, oval, diamond

Questions:
-Less or more than 1 input? -> No
-Input always array? -> Yes
-Input ever empty? -> No
-Array always contain 3 objects? -> Yes
-Keys will always be the ones presented? -> Yes
-Values will always be the ones presented? -> Yes
-All objects will have all the presented properties? -> Yes
-Color shade and shape will always be strings? -> Yes
-Number will always be a whole number? -> Yes

Examples:

Data Structure:
Input: Array of objects
Array - iteration

Algorithm:
-Create properties var to empty object
-Iterate over the input array
  -Push value of current key into the properties object key of the same name

-Transform the values of each property into unique arrays
-Return true if all arrays in uniqueSets have either 3 elements or if all have 1 element
*/

function isSet(cards) {
  let properties = { color: [], number: [], shade: [], shape: [] };
  cards.forEach(card => {
    for (let property in card) {
      properties[property].push(card[property])
    }
  })

  let values = Object.values(properties);
  let uniqueSets = values.map(value => Array.from(new Set(value)));
  return uniqueSets.every(set => set.length !== 2)
}

console.log(isSet([
  { color: "green", number: 1, shade: "empty", shape: "squiggle" },
  { color: "red", number: 2, shade: "lined", shape: "diamond" },
  { color: "purple", number: 3, shade: "full", shape: "oval" }
])); // true

console.log(isSet([
  { color: "red", number: 1, shade: "empty", shape: "squiggle" },
  { color: "red", number: 1, shade: "lined", shape: "diamond" },
  { color: "red", number: 1, shade: "full", shape: "oval" }
])); // true

console.log(isSet([
  { color: "red", number: 1, shade: "empty", shape: "oval" },
  { color: "red", number: 1, shade: "empty", shape: "oval" },
  { color: "red", number: 1, shade: "empty", shape: "oval" }
])); // true

console.log(isSet([
  { color: "red", number: 1, shade: "empty", shape: "squiggle" },
  { color: "red", number: 2, shade: "lined", shape: "diamond" },
  { color: "purple", number: 3, shade: "full", shape: "oval" }
])); // false

console.log(isSet([
  { color: "red", number: 2, shade: "empty", shape: "squiggle" },
  { color: "red", number: 2, shade: "empty", shape: "diamond" },
  { color: "red", number: 3, shade: "full", shape: "oval" }
])); // false

console.log(isSet([
  { color: "green", number: 1, shade: "empty", shape: "squiggle" },
  { color: "green", number: 2, shade: "empty", shape: "diamond" },
  { color: "green", number: 3, shade: "empty", shape: "oval" }
])); // true

console.log(isSet([
  { color: "purple", number: 1, shade: "full", shape: "oval" },
  { color: "green", number: 1, shade: "full", shape: "oval" },
  { color: "red", number: 1, shade: "full", shape: "oval" }
])); // true

console.log(isSet([
  { color: "purple", number: 3, shade: "full", shape: "oval" },
  { color: "green", number: 1, shade: "full", shape: "oval" },
  { color: "red", number: 3, shade: "full", shape: "oval" }
])); // false

console.log(isSet(
  [{color: "red", number: 1, shade: "empty", shape: "squiggle"},
  {color: "red", number: 2, shade: "lined", shape: "diamond"},
  {color: "red", number: 3, shade: "full", shape: "oval"}]
  )); // true)

console.log(isSet(
  [{color: "green", number: 1, shade: "empty", shape: "squiggle"},
  {color: "green", number: 2, shade: "empty", shape: "diamond"},
  {color: "green", number: 3, shade: "empty", shape: "oval"}]
  )); // true)

console.log(isSet(
  [{color: "purple", number: 1, shade: "full", shape: "oval"},
  {color: "green", number: 1, shade: "full", shape: "oval"},
  {color: "red", number: 1, shade: "full", shape: "oval"}]
  )); // true)

console.log(isSet(
  [{color: "purple", number: 3, shade: "full", shape: "oval"},
  {color: "green", number: 1, shade: "full", shape: "oval"},
  {color: "red", number: 3, shade: "full", shape: "oval"}]
  )); // false)

console.log(isSet(
  [{color: "red", number: 1, shade: "empty", shape: "squiggle"},
  {color: "red", number: 2, shade: "lined", shape: "diamond"},
  {color: "purple", number: 3, shade: "full", shape: "oval"}]
  )); // false)

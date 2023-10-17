const SQUARE_METER = 10.7639
let rlSync = require('readline-sync');
let length = Number(rlSync.question("Enter the length of the room in meters:\n"));
let width = Number(rlSync.question("Enter the width of the room in meters:\n"));
let area = length * width;
let areaInFeet = area * SQUARE_METER;

console.log(`The area of the room is ${area} square meters (${areaInFeet.toFixed(2)} square feet).`);
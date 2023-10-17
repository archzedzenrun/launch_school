let rlSync = require('readline-sync');
let bill = parseFloat(rlSync.question("Enter the bill amount:\n"));
let tipRate = parseFloat(rlSync.question("Enter the tip rate:\n"));

let tip = bill * (tipRate / 100);
let total = bill + tip;

console.log(`The tip is $${tip.toFixed(2)}`);
console.log(`The total is $${total.toFixed(2)}`);
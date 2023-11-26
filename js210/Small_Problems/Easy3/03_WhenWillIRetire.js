let rlSync = require('readline-sync');
let age = Number(rlSync.question("What is your age? "));
let retirementAge = Number(rlSync.question("What age would you like to retire? "));
let curYear = new Date().getFullYear();
let retirementYear = (retirementAge - age) + curYear;
console.log(`It's ${curYear}. You will retire in ${retirementYear}.`);
console.log(`You have only ${retirementYear - curYear} years left to go!`);
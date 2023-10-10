/*
Algorithm:
-Prompt the user for 3 different numbers and save them to variables.
-Find the average of these 3 numbers
-If average is >= 90 then grade is 'A'
-If average is >= 70 and < 90 grade is 'B'
-If average is >= 50 and < 70 grade is 'C'
-If average less than 50 grade is 'F'
*/

function findAverage(scores) {
  let sum = 0;
  for (let num of scores) {
    sum += num;
  }

  return sum / scores.length;
}

function calculateGrade(average) {
  if (average < 50) {
    return 'F';
  } else if (average < 70) {
    return 'C';
  } else if (average < 90) {
    return 'B';
  } else {
    return 'A';
  }
}

let rlSync = require('readline-sync');
let scores = [];
let score;

while (score !== 'c') {
  score = rlSync.question("Enter a score or press c to calculate grade: ");
  if (score == 'c') break;
  scores.push(Number(score));
}

let average = findAverage(scores);
let grade = calculateGrade(average);

console.log(`Based on the average of your ${scores.length} scores your letter grade is "${grade}".`);
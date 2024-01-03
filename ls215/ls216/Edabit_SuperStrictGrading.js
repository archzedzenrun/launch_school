/*
https://edabit.com/challenge/jq6Ra5ms4hPTk9GNi
TIME TAKEN: 22:00

Given an object literal of student names and an array of their test scores over the semester, return a list of all the students who passed the course (in alphabetical order). However, there is one more thing to mention: the pass mark is 100% in everything!

Remember to return an array of student names sorted alphabetically.

Input: Object
Output: Array

Rules:
-Input object contains an array of grades for values
-Find the students who have ALL perfect scores
-Sort the names alphabetically in the output
-Return [] if input is empty

Questions:
-Only 1 arg passed? -> Yes
-Arg always object? -> Yes
-Object ever empty? -> Could be
-Will values in object always be array? -> Yes
-Can the array be any size? -> Yes
-Can the array be empty? -> Yes
-Will the array only contain strings? -> Yes
-Will the strings always be numbers separated by a /? -> Yes

Data Structure:
Input: Object
Array for iteration
Output: Array

Algorithm:
-Iterate over the entries of the input object (filter)
  -Return true if all of the scores are perfect
    -Iterate through the scores
      -Split the string at '/' and return true if the 2 values are the same
-Sort the filtered array alphabetically and return it
*/

function perfectScores(scores) {
  if (scores.length === 0) return false;
  return scores.every(score => {
    let splitScore = score.split('/');
    return splitScore[0] === splitScore[1];
  })
}

function whoPassed(students) {
  let results = [];
  Object.entries(students).forEach(student => {
    if (perfectScores(student[1])) results.push(student[0]);
  })

  return results.sort((name1, name2) => name1.localeCompare(name2));
}

console.log(whoPassed({
  "John" : ["5/5", "50/50", "10/10", "10/10"],
  "Sarah" : ["4/8", "50/57", "7/10", "10/18"],
  "Adam" : ["8/10", "22/25", "3/5", "5/5"],
  "Barry" : ["3/3", "20/20"]
})); //➞ ["Barry", "John"]

console.log(whoPassed({
  "Zara" : ["10/10"],
  "Kris" : ["30/30"],
  "Charlie" : ["100/100"],
  "Alex" : ["1/1"]
})); //➞ ["Alex", "Charlie", "Kris", "Zara"]

console.log(whoPassed({
  "Zach" : ["10/10", "2/4"],
  "Fred" : ["7/9", "2/3"]
})); //➞ []

console.log(whoPassed({
  "Zach" : [],
  "Fred" : ["9/9", "3/3"]
})); //➞ ['Fred']

console.log(whoPassed({
  "Zach" : [],
  "Fred" : ["8/9", "1/3"]
})); //➞ []

console.log(whoPassed({
  "Zach" : [],
  "Fred" : []
})); //➞ []
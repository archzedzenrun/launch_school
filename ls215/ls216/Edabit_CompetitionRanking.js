/*

TIME TAKEN: 52:35

Standard competition ranking (also known as "1224" ranking) assigns the same rank to matching values. Rank numbers are increased each time, so ranks are sometimes skipped. If we have 5 scores (the highest score having a rank of 1):

Input: Object, String
Output: Integer

Rules:
-Assign ranks to each property with rank 1 being the highest value
-Matching values are assigned the same rank
-Rank numbers are always increased
-Rank numbers might be skipped if more than 1 property has the same rank

-There will always be 5 object properties
-Object values wont always be ordered

Questions:
-Less or more than 2 args? -> No
-Args will always be object and string -> Yes
-Will object ever be empty? -> No
-Can object be any size? ->
-Will object be sorted by values? -> No

-String arg ever empty? -> No
-String arg always exist as obj property? -> Yes

Examples:

competitionRank({
  George: 96, // 1
  Emily: 95, // 2
  Susan: 93, // 3
  Jane: 89, // 4
  Brett: 82 // 5
  }, "Jane") ➞ 4

competitionRank({
  George: 90, // 5
  Emily: 95, // 3
  Susan: 93, // 4
  Jane: 99, // 1
  Brett: 99 // 1
  }, "Jane") ➞ 1

competitionRank({
  Kate: 92, // 1
  Carol: 92, // 1
  Jess: 87, // 3
  Bruce: 87, // 3
  Scott: 84 // 5
  }, "Bruce") ➞ 3

currentRank = 2

{ Kate: 1

Data Structure:
Array - Iteration
Object

Algorithm:
-Create ranks variable to empty object
-Create currentRank variable starting at 1
-Sort obj arg properties by value in descending order
-Iterate through the obj entries
  -Add persons name as a property in ranks obj
  -If persons value is equal to the value of the previous person:
    -Set the persons value to currentRank - 1
  -Othersise set the persons value to currentRank
  -Increment currentRank by 1
-Return the rank of the person referenced by string arg
  */

// function competitionRank(obj, name) {
//   let currentRank = 1;
//   let sortedObj = Object.entries(obj).sort((p1, p2) => p2[1] - p1[1]);

//   let ranks = [[sortedObj[0][0], sortedObj[0][1], 1]];
//   sortedObj.slice(1).forEach(person => {
//     currentRank += 1;
//     let currentName = person[0];
//     let currentScore = person[1];
//     let previousScore = ranks[ranks.length - 1][1];
//     let previousRank = ranks[ranks.length - 1][2];
//     if (currentScore === previousScore) {
//       ranks.push([currentName, currentScore, previousRank]);
//     } else {
//       ranks.push([currentName, currentScore, currentRank]);
//     }
//   })

//   for (let i = 0; i < ranks.length; i += 1) {
//     if (ranks[i][0] === name) {
//       return ranks[i][2];
//     }
//   }
// }

// 52:35

function competitionRank(obj, name) {
  let currentRank = 0;
  let sortedObj = Object.entries(obj).sort((p1, p2) => p2[1] - p1[1]);
  let ranks = sortedObj.map((person, idx) => {
    currentRank += 1;
    if (idx === 0) {
      person.push(currentRank);
    } else if (person[1] === sortedObj[idx - 1][1]) {
      person.push(sortedObj[idx - 1][2])
    } else {
      person.push(currentRank);
    }

  return person;
  })

  return ranks.filter(person => person[0] === name)[0][2];
}

console.log(competitionRank({
  George: 96, // 1
  Emily: 95, // 2
  Susan: 93, // 3
  Jane: 89, // 4
  Brett: 82 // 5
  }, "Jane")) //➞ 4

console.log(competitionRank({
  George: 90, // 5
  Emily: 95, // 3
  Susan: 93, // 4
  Jane: 99, // 1
  Brett: 99 // 1
  }, "Jane")) //➞ 1

console.log(competitionRank({
  Kate: 92, // 1
  Carol: 92, // 1
  Jess: 87, // 3
  Bruce: 87, // 3
  Scott: 84 // 5
  }, "Bruce")) //➞ 3

console.log(competitionRank({
  Kate: 92, // 1
  Carol: 92, // 1
  Jess: 92, // 1
  Bruce: 87, // 4
  Scott: 87 // 4
  }, "Bruce")) //➞ 4
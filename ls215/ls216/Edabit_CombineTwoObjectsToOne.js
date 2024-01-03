/*
https://edabit.com/challenge/JyebLWZjCv5jYhrBW
TIME TAKEN: 24:00

Take two objects with similar key values and combine them into a new object summing any values that belong to the same category.

There's a married couple, Hank and his spouse Sheila. Hank works at a power plant making $70,000 a year, and Sheila is a teacher making $40,000 a year. They both earn rental income from separate rental properties, Hank will get $12,000 and Sheila $10,000. The new object will show their separate income but combine the rental income because it fits the same category.

const user1 = {
  powerPlant: 70000,
  rental: 12000
}

const user2 = {
  teaching: 40000,
  rental: 10000
}

becomes ➞ {
  powerPlant: 70000,
  teaching: 40000,
  rental: 22000   // The rental income is added together.
}

Input: 2 Objects
Output: Object

Rules:
-Create a new object containing unique keys from all inputs
-Any keys that are the same will be summed together into one value
-Order the results by values in ascending order lowest to highest

Questions:
-Less or more than 2 args passed? -> No
-Args always objects? -> Yes
-Will the objects ever be empty -> Maybe
-Can they both be empty? -> Maybe
-Will values in the objects always be whole numbers? -> Yes
-Will they ever be 0 or negative? -> No
-Should the keys in the output be sorted a specific way? -> Yes
-Can the objects be any size? -> Yes

Data Structure:
Objects
Arrays for iteration?

Algorithm:
-Combine all arg entries into one array
-Create a results var to an empty object
-Iterate through the combined array
  -If index 0 exists in results object as a key
    -Add the current value (index 1) to that key value in the results object
  -Otherwise, set index 0 as a key and index 1 of current element in the results object
-Sort the results object in ascending order by values
-Return the sorted object
*/

function combine(user1, user2) {
  let results = {};
  let joinedUsers = Object.entries(user1).concat(Object.entries(user2));
  joinedUsers.forEach(entry => {
    if (results[entry[0]]) {
      results[entry[0]] += entry[1];
    } else {
      results[entry[0]] = entry[1];
    }
  })

  let sortedResults = Object.entries(results).sort((a, b) => a[1] - b[1]);
  return Object.fromEntries(sortedResults);
}

const user1 = {
  powerPlant: 70000,
  rental: 12000
}

const user2 = {
  teaching: 40000,
  rental: 10000
}

const user3 = {
  rental: 12000
}


console.log(combine({}, {})); // {}
console.log(combine({}, user1)); // {powerPlant: 70000,rental: 12000}
console.log(combine({}, user2)); // {teaching: 40000,rental: 10000}
console.log(combine(user1, user2));
// rental: 22000 ,
// teaching: 40000,
// powerPlant: 70000,
console.log(combine(user3, user2)) // {rental: 22000, powerPlant: 70000}
console.log(combine(user3, user3)) // {rental: 24000}
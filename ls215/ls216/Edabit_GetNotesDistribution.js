/*
https://edabit.com/challenge/WyEL2YcemhrS4waEE

Create a function that takes an array of students and returns an object representing their notes distribution. Keep in mind that all invalid notes should not be counted in the distribution. Valid notes are: 1, 2, 3, 4, 5
Example

Questions:
Less or more than one arg? -> No
Will input be empty? -> No

Input: Array of objects
Output: Object with notes as properties and the number of each as values

Algorithm:
-Create a notes variable to an empty array
-Iterate through the input array
  -Push the value of the notes property to the notes array
-Flatten the notes array

-Create a counts variable to the return of passing notes array to helper funection

Helper function
Input: Array
Output: Object
-Iterate through the array
  -If current element is 1-5
    -Check if it exists in the counts object
    -If it does increment the value by 1
    -Otherwise set hte value to 1
-Return the counts object
*/

// function countNums(array) {
//   array = array.filter(num => '12345'.includes(String(num)));
//   return array.reduce((counts, num) => {
//     counts[num] ? counts[num] += 1 : counts[num] = 1;
//     return counts;
//   }, {})
// }

// function getNotesDistribution(array) {
//   let notes = [];
//   array.forEach(student => notes.push(student.notes));
//   return countNums(notes.flat());
// }

function countNotes(array) {
  array = array.filter(num => '12345'.includes(String(num)));
  return array.reduce((counts, num) => {
    counts[num] ? counts[num] += 1 : counts[num] = 1;
    return counts;
  }, {})
}

function getNotesDistribution(array) {
  let notes = array.flatMap(student => student.notes);
  return countNotes(notes);
}
console.log(getNotesDistribution({ 5: 1, 'a': 1 , '2' : 0 }))

console.log(getNotesDistribution([
  {
    "name": "Steve",
    "notes": [5, 5, 3, -1, [5], 6]
  },
  {
    "name": "John",
    "notes": [3, 2, 5, 0, -3]
  }
])) //➞ {
  //5: 3,
  //3: 2,
  //2: 1
//})


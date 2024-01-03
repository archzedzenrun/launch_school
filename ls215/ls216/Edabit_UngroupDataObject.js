/*
https://edabit.com/challenge/NcRsSwrJbMm4dRbCk

// You volunteered to help out teaching a preschool in your area! You were given an array of all students and some important data about them, grouped by their teacher. Create a function that will ungroup every student so you can look at their details individually.
// Example

Input:
Object with property 'teacher' and a string value of the teacher name, and a second property 'data'. data is an array of objects with each object containing properties for student 'name' and additonal properties

We want to associate a teacher property with each 'data' property

If we iterate trhough the input array, first element will look like:
{ teacher: "Ms. Car", data: [{ name: "James", emergenceNumber: "617-771-1082",},
{ name: "Alice", alergies: ["nuts", "carrots"], }], }

We then need to iterate over the 'data' property, on each iteration:
We need to create an object something like:
{ teacher: value of teacher, and all the entries of the current data property }

Algorithm:
-Create results variable to empty array
-Iterate through input array
  -Iterate through the 'data' property (array of objects)
    -Create a currentObject variable to {}
    -Add 'teacher' property and its value to the object
    -Iterate through each student object and add its data to currentObject
    -Push currentObject to results
-Return results;
*/

function ungroupStudents(array) {
  let results = [];
  array.forEach(object => {
    object.data.forEach(studentData => {
      let newObject = { teacher: object.teacher }
      for (let entry in studentData) {
        newObject[entry] = studentData[entry];
      }
      results.push(newObject);
    })
  })

  return results;
}

console.log(ungroupStudents([{ teacher: "Ms. Car", data: [{
     name: "James",
     emergenceNumber: "617-771-1082",
  }, {
     name: "Alice",
     alergies: ["nuts", "carrots"],
  }],
}, {
  teacher: "Mr. Lamb",
  data: [{
    name: "Aaron",
    age: 3
  }]
}])) // [{ teacher: "Ms. Car", name: "James", emergencyNumber: "617-771-1082",}, { teacher: "Ms. Car", name: "Alice", alergies: ["nuts", "carrots"],}, { teacher: "Mr. Lamb", name: "Aaron", age: 3,}]
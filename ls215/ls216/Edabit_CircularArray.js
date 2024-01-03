/*
Write a function that determines if an array is circular. An array is circular if its subarrays can be reordered such that each subarray's last element is equal to the next subarray's first element.

Input: Array of subarrays
Output: Boolean

Rules:
-Check if the subarrays can be reordered so that the last element is equal to the next first element in each sub array
-Input and subarrays will be arrays
-Subarrays will contain positive integers > 0

Questions:
-Less or mor ethan 1 args? -> No
-Can the array be empty? -> No
-Will the array contain at least 2 subarrays? -> Yes

Examples:
[[1, 2], [2, 1]] // true
[[2, 3], [1, 2]] // true
[[2, 3], [1, 2], [3, 4]] // true
[[2, 3], [5, 6]] // false
[[2, 3], [3, 4], [6, 7]] // false
[[1, 3, 2], [4, 1], [2, 7, 1]] // true


[[1, 3, 2], [4, 1], [2, 7, 1]]
[1, 3, 2], [2, 7, 1], [4, 1] -> [4, 1], [1, 3, 2], [2, 7, 1]



Data Strucutre:
Arrays

Algorithm:
-Iterate through the input array // [1, 3, 2]
  -Cretae a toggle variable to true
   -Create a copy of the input array // [1, 3, 2], [2, 7, 1], [4, 1]

  -While toggle is true:

  -Delete the current subarray from the copy array [[2, 7, 1], [4, 1]]

  -Create a currentSubArray variable to the current subarray

  -Iterate through copy array
    -Check if first num is equal to last num in currentSubArray
    -If it is: Set currentSubArray to the current element

  -

  -If there arent any, continue to the next subarray in the input

*/

function isCircular(array) {
  for (let idx = 0; idx < array.length; idx += 1) {
    let toggle = true;
    let arrayCopy = array.slice();
    let currentSubArray = array[idx]; // [2, 7, 1]
    while (arrayCopy.length !== 0) {

      arrayCopy.splice(idx, 1);

      for (let copyIdx = 0; copyIdx < arrayCopy.length; copyIdx += 1) {
        if (arrayCopy[copyIdx][0] === currentSubArray[currentSubArray.length - 1]) {
          currentSubArray = arrayCopy[copyIdx];
          break;
        }
      }

      if (arrayCopy.length === 0) {
        toggle = false;
      }
    }

    if (toggle === false) continue;


  }
}

console.log(isCircular([[1, 3, 2], [4, 1], [2, 7, 1]])); // true

// Trish solution

// function sameLength(obj1, obj2) {
//   return Object.entries(obj1).length === Object.entries(obj2).length;
// }

// function sameKeys(obj1, obj2) {
//   let otherKeys = Object.keys(obj2);
//   return Object.keys(obj1).every((key, idx) => key === otherKeys[idx]);
// }

// function sameValues(obj1, obj2) {
//   let otherValues = Object.values(obj2);
//   return Object.values(obj1).every((val, idx) => val === otherValues[idx]);
// }

// function isCircular(arr) {
//   let firstElements = {};
//   arr.forEach(subarr => Object.keys(firstElements).includes(String(subarr[0])) ? firstElements[subarr[0]] += 1 : firstElements[subarr[0]] = 1);

//   let lastElements = {};
//   arr.forEach(subarr => {
//     if (Object.keys(lastElements).includes(String(subarr[subarr.length - 1]))) {
//       lastElements[subarr[subarr.length - 1]] += 1;
//     } else {
//       lastElements[String(subarr[subarr.length - 1])] = 1;
//     }
//   })

//   return sameLength(firstElements, lastElements) && sameKeys(firstElements, lastElements) && sameValues(firstElements, lastElements);
// }


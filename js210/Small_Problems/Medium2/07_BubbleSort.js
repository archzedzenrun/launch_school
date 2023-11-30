/*
Data Structure:
Array - Iterations/swapping

Algorithm:
-Iterate through the numbers of the input array
-Check if current number is greater than the next number in the array
-If it is, swap their positions in the array
-Otherwise continue to the next number

-Repeat this entire process until there are no swaps left to be made
*/

function bubbleSort(arr) {
  let swaps;
  do {
    swaps = false;
    for (let idx = 0; idx < arr.length - 1; idx += 1) {
      let currentVal = arr[idx];
      let nextVal = arr[idx + 1];
      if (currentVal > nextVal) {
        arr[idx] = nextVal;
        arr[idx + 1] = currentVal;
        swaps = true;
      }
    }
  } while (swaps);

  return arr;
}

const array1 = [5, 3];
console.log(bubbleSort(array1));
console.log(array1);    // [3, 5]

const array2 = [6, 2, 7, 1, 4];
console.log(bubbleSort(array2));
console.log(array2);    // [1, 2, 4, 6, 7]

const array3 = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
console.log(bubbleSort(array3));
console.log(array3);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
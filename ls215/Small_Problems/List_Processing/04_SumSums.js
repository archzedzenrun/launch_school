/*
Algorithm:
-Initialize total sum variable
-Iterate through the input array
  -Find the sum of current number and all previous numbers
  -Add sum to total sum
-Return total sum
*/

function sumOfSums(arr) {
  let total = 0;
  for (let outerIdx = 0; outerIdx < arr.length; outerIdx += 1) {
    let sum = 0;
    for (let innerIdx = 0; innerIdx <= outerIdx; innerIdx += 1) {
      sum += arr[innerIdx];
    }

    total += sum;
  }

  return total;
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
// PP 1
// No, this will result in a syntax error.

// PP 2
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

// PP 3
// The problem with this code is that variable sum is already assigned to a value of 0
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);

// sum += sum(numbers);  // ?
console.log(sum);

// PP 4
// function countdown(num) {
//   (function(n) {
//     for (let count = n; count >= 0; count -= 1) {
//       console.log(count);
//     }

//     console.log('Done!');
//   })(num);
// }

// countdown(7);

// PP 5
// No, even if a function is named, it isnt visible outside of the IIFE scope.

// PP 6
function countdown(num) {
  (function recursiveCount(n) {
    if (n === 0) {
      console.log('Done!');
      return;
    }

    console.log(n);
    recursiveCount(n - 1);
  })(num);
}

countdown(7);

// PP 1
// Higher-order functions can accept functions as arguments or return functions. (or both).

// PP 2
// filter is a higher order function because it takes a function (in this case checkEven) as an argument.

// PP 3
let numbers = [1, 2, 3, 4];
function makeCheckEven() {
  return function(num) {
    return num % 2 === 0;
  }
}

let checkEven = makeCheckEven();

console.log(numbers.filter(checkEven)); // [2, 4]

// PP 4
function execute(func, operand) {
  return func(operand);
}

console.log(execute(function(number) {
  return number * 2;
}, 10)); // 20

console.log(execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy')); // "HEY THERE BUDDY"

// PP 5
function makeListTransformer(func) {
  return function(array) {
    return array.map(func);
  }
}

let timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

console.log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]
// PP 1
// function makeMultipleLister(num) {
//   return function() {
//     for (let n = 1; n < 100; n += 1) {
//       if (n % num === 0) console.log(n);
//     }
//   }
// }

// Better Version

function makeMultipleLister(num) {
  return function() {
    let i;
    for (let i = num; i < 100; i += num) {
      console.log(i);
    }
  }
}

let lister = makeMultipleLister(13);
lister();

// PP 2
let total = 0;

function add(num) {
  total += num;
  console.log(total);
}

function subtract(num) {
  total -= num;
  console.log(total);
}

// PP 3
// There is no way to access the value of the status variable outside of the startup function.
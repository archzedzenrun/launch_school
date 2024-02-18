// PP 1
function delayLog() {
  for (let num = 1; num <= 10; num += 1) {
    setTimeout(function() {
      console.log(num);
    }, num * 1000)
  }
}

delayLog();

// PP 2
setTimeout(() => { // 1
  console.log('Once'); // 5
}, 1000);

setTimeout(() => { // 2
  console.log('upon'); // 7
}, 3000);

setTimeout(() => { // 3
  console.log('a'); // 6
}, 2000);

setTimeout(() => { // 4
  console.log('time'); // 8
}, 4000);

// PP 3
setTimeout(() => { // 1
  setTimeout(() => { // 6
    q(); // 11
  }, 15);

  d(); // 7

  setTimeout(() => { // 8
    n(); // 10
  }, 5);

  z(); // 9
}, 10);

setTimeout(() => { // 2
  s(); // 12
}, 20);

setTimeout(() => { // 3
  f(); // 4
});

g(); // 5

// solution: g f d z n s q

// PP 4
function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000);
}

afterNSeconds(function() {
  console.log('hi');
}, 5)
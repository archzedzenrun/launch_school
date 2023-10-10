function isPrime(num) {
  if (num <= 1 || (num > 2 && num % 2 === 0)) {
    return false;
  }

  for (let i = 3; i < num; i += 2) {
    if (num % i === 0) return false;
  }

  return true;
}

function checkGoldbach(num) {
  if (num < 4 || num % 2 === 1) {
    console.log(null);
    return;
  }

  let pairs = [];

  for (let i = 2; i < num; i += 1) {
    let j = 100 - i;
    if (i > j) break;
    pairs.push([i, 100 - i]);
  }

  pairs.forEach(function(pair) {
    if (isPrime(pair[0]) && isPrime(pair[1])) {
      console.log(pair);
    }
  })
}

console.log(checkGoldbach(3));
console.log(checkGoldbach(4));
console.log(checkGoldbach(12));
console.log(checkGoldbach(100));
function findDivisors(num) {
  let divisors = [];
  for (let i = 1; i <= num; i += 1) {
    if (num % i === 0) {
      divisors.push(i);
    }
  }

  return divisors;
}

function largestValue(nums) {
  return Math.max(...nums);
}

function gcd(div1, div2) {
  div1 = findDivisors(div1);
  div2 = findDivisors(div2);
  let commonDivisors = div1.filter(num => div2.includes(num));
  return largestValue(commonDivisors);
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
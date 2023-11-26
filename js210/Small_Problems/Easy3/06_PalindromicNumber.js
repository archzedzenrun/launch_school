function isPalindrome(str) {
  return str === [...str].reverse().join('');
}

function isPalindromicNumber(num) {
  return isPalindrome(String(num));
}

console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true
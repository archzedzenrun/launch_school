const p = (str) => console.log(str);

function isPalindrome(str) {
  return str === [...str].reverse().join('');
}

p(isPalindrome('madam'));               // true
p(isPalindrome('Madam'));               // false (case matters)
p(isPalindrome("madam i'm adam"));      // false (all characters matter)
p(isPalindrome('356653'));              // true
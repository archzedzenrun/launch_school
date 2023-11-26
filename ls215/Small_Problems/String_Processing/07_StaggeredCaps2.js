function staggeredCase(string) {
  let toUpper = true;
  let newString = '';

  [...string].forEach(char => {
    if (/[a-z]/i.test(char)) {
      if (toUpper) {
        newString += char.toUpperCase();
      } else {
        newString += char.toLowerCase();
      }

      toUpper = !toUpper
    } else {
      newString += char;
    }

  });

  return newString;
}

console.log(staggeredCase('I Love Launch School!'));        // "I lOvE lAuNcH sChOoL!"
console.log(staggeredCase('ALL CAPS'));                     // "AlL cApS"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 nUmBeRs"

/*
toUpper = true
A -> toUpper false
l -> toUpper true
L -> toUpper false
'' -> toUpper false
c -> toUpper true
A -> toUpper false
p -> toUpper true
S -> toUpper false
*/
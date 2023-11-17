/*
Algorithm:
-Split the input string at the @ symbols.
  -Return false if there are more than 2 components.
-Iterate through the characters of the first part of the split input (local name).
  -Make sure each character is a-z, A-Z or 0-9.
    -Return false if its not

-Split the second part of the split input at the '.'
  -Check that the size of the split domain is at least 2 components.
    -Return false if its not
  -Check if each component of the domain has at least 1 character
    -Return false if it doesnt
  -Check if each component has only a-z or A-Z.
    -Return false if it doesnt

-Otherwise return true
*/

// function oneAtSign(email) {
//   return email.split('@').length === 2;
// }

function validLocal(local) {
  return [...local].every(char => /[a-zA-Z0-9]/.test(char));
}

function validDomain(domain) {
  domain = domain.split('.');
  if (domain.length < 2 || domain.some(word => word === '')) {
    return false;
  }

  return domain.every(component => {
    return [...component].every(char => /[a-zA-Z]/.test(char));
  });
}

function isValidEmail(email) {
  email = email.split('@');
  if (email.length !== 2) {
    return false;
  }

  return validLocal(email[0]) && validDomain(email[1]);
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false, no dot
console.log(isValidEmail('foo.bar@baz.to'));          // returns false, dot in local
console.log(isValidEmail('foo@baz.'));                // returns false, empty domain component
console.log(isValidEmail('foo_bat@baz'));             // returns false, local has non a-z
console.log(isValidEmail('foo@bar.a12'));             // returns false, domain has non a-z
console.log(isValidEmail('foo_bar@baz.com'));         // returns false, local has non a-z
console.log(isValidEmail('foo@bar.....com'));         // returns false, empty domain components
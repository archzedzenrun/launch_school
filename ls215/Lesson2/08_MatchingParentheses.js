/*
Algorithm:
-Extract parentheses from string into an array
-If the first parentheses is ) or the last is ( return false
-Iterate through the array
  -Increment a variable by 1 when current char is (
  -Decrement by 1 when char is )
Check if variable is equal to 0
*/

function isBalanced(string) {
  let parentheses = [...string].filter(char => '()'.includes(char));
  if (parentheses[0] === ')' || parentheses[parentheses.length - 1] === '(') {
    return false;
  }

  let counter = 0;
  parentheses.forEach(parenthese => {
    parenthese === '(' ? counter += 1 : counter -= 1;
  })

  return counter === 0;
}

console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
// This will log 'Hello, world' because functions are 'hoisted' to the top of their scope before JS executes the code.

// Further exploration: function declarations take precedence over variables with the same name. The hoisted code looks like:

function logValue() {
  console.log('Hello, world!');
}

var logValue;

logValue = 'foo';

console.log(typeof logValue);

// Line 13 logs string.
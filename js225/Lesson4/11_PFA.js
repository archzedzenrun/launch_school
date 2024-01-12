// PP 1
function greet(greeting, name) {
  greeting = greeting[0].toUpperCase() + greeting.slice(1);
  console.log(greeting + ', ' + name + '!');
}

greet('howdy', 'Joe');
// Howdy, Joe!
greet('good morning', 'Sue');
// Good morning, Sue!

// PP 2
function partial(primary, arg1) {
  return function(arg2) {
    return primary(arg1, arg2);
  };
}


let sayHello = partial(greet, 'hello');
let sayHi = partial(greet, 'hi');

sayHello('Brandon');
sayHi('Sarah');
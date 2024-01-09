// PP 1
// window object, it is not accessible as the implicit execution context when strict mode is enabled.

// PP 2
// true, a = 10 is added as a property to the window object. window.a and a both have a value of 10.

// PP 3
// a = 10 will raise an error with strict mode enabled. assigning value to a variable that hasnt been previously declared is not allowed.

// PP 4
// raises an error because variable b was declared in the func function and is not accessible outside of the function.

// PP 5
// this logs 1 because b is added as a property to the window object when func is invoked and is therefore accessible outside of the function.

// PP 6
// line 4 raises an error, with strict mode enabled, assigning value to variables that haven't been declared is not allowed.
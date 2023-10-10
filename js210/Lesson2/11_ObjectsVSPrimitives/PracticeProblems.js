// Problem 1 ------------------------------------------------------------------

// This code will log 'Hello' because strings are primitive values and therefore cannot be mutated. Line 2 creates a new string object.

// Problem 2 ------------------------------------------------------------------

// This code will output:
// 'Hello'
// 'Hello'
// 'Hello'

// None of the method invocations affect the string referenced by myWord.

// Problem 3 ------------------------------------------------------------------

// This will log ['Hello', 'Goodbye'] because arrays are mutable objects and the push method mutates the object it was invoked on.

// Problem 4 ------------------------------------------------------------------

// This will log ['Hello'] because the concat method is non-mutating.

// Problem 5 ------------------------------------------------------------------

// This will log ['Hello'] because line 2 is invoking the toUpperCase method on a string which is an immutable object, therefore the first element of the myWords array is unchanged.

// Problem 6 ------------------------------------------------------------------

// This will log ['HELLO'] because the array is being mutated by changing the value at index 0.
// Problem 1 ------------------------------------------------------------------

// This will output undefined because variables declared with var have function scope and after hoisting, a is declared but not yet assigned value.

// Problem 2 ------------------------------------------------------------------

// This will result in an error because variables defined with let have block scope. Variables declared with let or const are in the Temporal Dead Zone after hoisting, meaning they are in an 'unset' state.

// Problem 3 ------------------------------------------------------------------

// Line 10 will output 'hello' because 'a' on line 2 is in scope with line 3. Line 13 raises an error because there is no variable 'a' in the global scope.

// Problem 4 ------------------------------------------------------------------

// Line 10 will output 'hello' because 'a' on line 2 is in scope with line 3. Line 11 will also output 'hello' because a variable initialized without a declaration creates a global variable.

// Problem 5 ------------------------------------------------------------------

// Line 7 will output 4 because variable 'a' gets reassigned on every iteration of the for loop.

// Problem 6 ------------------------------------------------------------------

// Line 7 will output the value of the variable 'a' declared on line 1 which is in the global scope. The variable declaration on line 4 is only accessible by the inner scope of the block.

// Problem 7 ------------------------------------------------------------------

// On line 13 the foo function is invoked which returns the value of the bar function invocation on line 10. The bar function returns 4 which is what will be output. Line 14 will output the value of 'a' which has been reassigned to 3.

// Problem 8 ------------------------------------------------------------------

// Line 18 invokes the checkScope function which returns the value of the nested function. The nested function returns the value of the superNested function which is the value of variable a. a has been reassigned to 'superNested' which is what is output. Line 19 outputs global, the variable declaration on line 1 is never reassigned because variables declared inside the checkScope function are scoped to that function.

// Problem 9 ------------------------------------------------------------------

// Line 4 will output 'outer'
// Line 5 will output 'outer'
// Line 6 invokes the setScope function and passes 'outer' as an argument.
// Line 7 will still output 'outer' because a hasnt been changed.
// Line 8 will output 'inner'

// Problem 10 -----------------------------------------------------------------

// Line 8 will output 50 which is the current value of total
// Line 9 increments total by 10
// Line 10 will output 60, the new current value of total
// Line 11 will output 15, the current value of increment

// Problem 11 -----------------------------------------------------------------

// Line 3 will output 'outer' which is the current value of a declared on line 1.
// Line 4 invokes the setScope function which reassigns a to 'inner'.
// Line 5 will result in an error that setScope is not a function. When function expressions use var, only the name of the function is hoisted.
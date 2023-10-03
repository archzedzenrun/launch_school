// Problem 1 ------------------------------------------------------------------

// Line 8 will output 'outer' because the variable 'a' declared on line 1 is in the global scope.

// Line 9 invokes the testScope function and will output 'inner', which is the  value of the variable 'a' declared in the local scope of the function on line 4.

// Line 10 will output 'outer' because no change has been made to the 'a' variable declared on line 1.

// Problem 2 ------------------------------------------------------------------

// Line 8 will output 'outer' because the variable 'a' declared on line 1 is in the global scope.

// Line 9 invokes the testScope function which reassigns the value of variable 'a' to the value 'inner'. The output is 'inner'.

// Line 10 will output 'inner' because the testScope function invocation has reassigned the value of variable 'a'.

// Problem 3 ------------------------------------------------------------------

// On line 26 the goShopping function is invoked. Line 8 outputs 'empty' which is the value of the basket variable declared on line 1. On line 19 the shop1 function is invoked which reassings the value of variable 'basket' to a new value of 'tv'. On line 20 the shop2 function is invoked  which again reassings 'basket' to a new value of 'computer'. On line 21 the shop3 function is invoked which will output the value of the 'basket' variable declared on line 15 which is 'play station'. Finally, line 23 will output the value of globally scoped basket variable which is 'computer'.

// Output:
// 'empty'
// 'play station'
// 'computer'

// Problem 4 ------------------------------------------------------------------

// This code will output 'hi' because without a declaration, 'a' is scoped to the global level.

// Problem 5 ------------------------------------------------------------------

// This code will result in an error because 'a' has not been defined at the global level.

// Problem 6 ------------------------------------------------------------------

// This will output undefined instead of an error due to the way JS 'hoists' variables declared with var to the top of the program during the creation phase.

// Problem 7 ------------------------------------------------------------------

// This will result in an error because variables declared with let are in the Temporal Dead Zone which means they are unset and cannot be accessed before initialization.

// Problem 8 ------------------------------------------------------------------

// This will result in an error because the hello function hasnt been invoked so the 'a' variable is never initialized.
# Assignments and comparison
A variable declaration statement reserves a space in memory for a variable with that name. Variable names act as a label for that space in memory. `let test` is a declaration initialized with a value of undefined because an initializer was not used. `let test = 'var'` is a declaration that initializes the 'test' variable to an initial value of 'var'.

An initializer refers to = and the expression to the right in the declaration of a variable.

Note: An initial value is required in constant declarations.

Comparison operators compare two operands and return either true or false.

Note: JS is a dynamically typed language, meaning variables can be assigned or reassigned to any data type.

# Variable Scope, variable interaction with functions/blocks

If a variable is declared inside a function or block, it has local scope, otherwise it has global scope (available anywhere in the program).

The scope of a variable is where it is available for use in a program and this is determined by where it was declared. JS finds variables by searching the hierarchy of scopes defined in the source code from the bottom to the top, the scopes exist even if the code hasn't been executed. This is called lexical scoping (aka static scoping).

******let and const declarations have block scope. A block is executable code between curly braces.

Note: Object literals don't define blocks. Function bodies technically don't define blocks even though they do behave like them.

Variables declared in an outer scope are accessible from within a block, but not the other way around.

Note: Undeclared variables have global scope meaning they ignore block and function scoping rules and are available everywhere, even if something like `hi = 'hi';` was initialized in a block, it is still accessible throughout the program. Make sure variables are declared first to avoid potential conflicts.

# Function Scope

varibles declared in main scope have global scope. variabls declared in functions or blocks have local scope, meaning they are not accessible outside of that scope.

let and const declarations have block scope (local scope), var and function declarations have function scope which means they are scoped locally to the function.




Every function creates its own scope.

variables declared inside a function have function scope, and they cannot be accessed outside the body of the function.

Function names and parameters are considered variable names. Parameters are variables that are local to the function. Function names can be global or local variables depending on where they are defined. If they are defined in the top level of the program they have global scope, if they are nested inside another structure, they have local scope

Note: Functions nested inside other functions are also known as private functions since they are only accessible from within the function they were defined.

# Hoisting

* What is hoisting?
JavaScript operates in two phases, first with the creation phase where variable, function, and class declarations are found and seemingly moved to the top of their defined scope. The second phase is execution where the program runs line by line.

* How do var, let, and const interact with hoisting? How do they differ?

var and let differ because using var creates a property on the global object, but only when used at the top level. (let is safer, avoids bugs/conflicts).

unlike let, var is function scoped which means it is accessible from anywhere in the function that it was declared.

var variables have an initial value of undefined while let and const variables are in an unset state. Unset variables are known as being in the Temporal Dead Zone (TDZ).

* How do functions and classes interact with hoisting? How do they differ?

The entire function declaration and body is hoisted to the top of the scope. Asume that function declarations are hoisted before (above) variable declarations. A let or const variable cant have the same name as a function


* What part does hoisting play in the way a specific program works?


* How does hoisting really work?
During the creation phase, variable identifiers are added to either the global or local scope

MY UNDERSTANDING:

During the creation phase, the code is read from the top down. Variable, function, and class declarations are recognized during this phase. Let/const declarations are in the Temporal Dead Zone and are unset, var is undefined, assignments for these declared variables only happens during the execution phase.

# Primitive values, types, type conversions/coercions

Primitive values:
* String (a sequence of characters)
* Number (represents all types of numbers such as integers and floats)
* Undefined (absence of value) - type is undefined
* Null (absence of value, similar to undefined but must be used explicitly) - type is object but treated as primitive value.
* Boolean (true or false)
* Symbol

Note: Arrays and objects are both of the "object" type.
Note: NaN is a "number" type and happens when undefined math operations are performed. Trying to convert non-numbers to a number will return NaN. NaN is the only value that is not equal to itself.

**Implicit type coercion** is when a non string operand is automatically converted into a string when using the + operator.

If both operands are any combination of number/boolean/null/undefined, they are converted to numbers and added together when using + (true evaluates as 1, false/null evaluate as 0).

If one operand is an object/array/function both are converted to strings and concatenated when using +.

When using other operators (- * / %), strings are automatically converted into numbers.

**Explicit type coercion** is when you explicitly choose how a value will be coerced instead of it happening automatically.

`Number('1') -> 1`, `Number('a') -> NaN`, `String(3) -> '3'`

Note: parseInt stops converting characters to integers when it finds an invalid character in the string.

`parseInt(3.14) -> 3`

# Object properties and mutation

Changing what value a variable is assigned to is called reassignment. Changing the value itself that a variable is assigned to is called mutation. Reassignment makes a variable point to a new space in memory. Primitive values are not mutable, only objects/arrays can be mutated. Any operations performed on primitive values will return a NEW value/object. JS is pass-by-value when passing around primitive values and pass-by-reference when passing around arrays/objects.

# Loose and strict equality

Strict equality means that both operands have the same value and are of the same type when making a comparison using the strict equality operator `===` (aka the identity operator). The strict inequality operator `!==` checks for the opposite, it returns false if the operands have the same value and are of the same type.

Loose equality is when one operand is coerced into the same type as the other (if they are different) before being compared. The values are then compared and the loose equality operator `==` returns true if they are the same. The loose inequality operator `!=` returns false when the values are the same (after coercion). If one operand is a number and the other is a string, the other will be coerced into a number. If one operand is a boolean it gets coerced into a number. Example: `'0' == false` false gets coerced into number 0, then '0' gets coerced into a number, so this expression evaluates as true.

**Array Equality**

Arrays are equal only if they are the same object (having the same place in memory). Two arrays containing the same values are not considered equal.

# How passing arguments into a function may change the value that a variable points to

Pass by value means that any change made to an argument within a function wont affect the original object that was passed in. JS acts like pass by value when passing around primitive values.

Pass by reference means that an object passed as an argument to a function can be mutated/changed within that function. JS acts like pass by reference when passing around arrays and objects.

# Working with strings, arrays, and objects

**Iterative methods**

A function that is passed as an argument to another function is called a callback function. The callback function is then invoked at certain times. For example, the forEach method invokes the callback function once for each element in the array that it was invoked on, with each element being passed as an argument to the callback function.

forEach returns undefined.

Book says we can use arrow functions instead of a function expression. Is an arrow function not a function expression?????????????

The map method transforms an array by returning a NEW array containing the return values of passing each element from the calling array to the callback function.

The filter method returns a NEW array containing elements from the original array based on the truthiness of the return value of the callback function. Elements will be added to the new array if the return value of the callback function evaluates as truthy.

The find method returns the first element from the calling array for which the return value of the callback function evalated as true. Returns undefined otherwise.

The reduce method takes two arguments, a callback function and a value that acts as an accumulator. The callback function also takes two arguments, the first being the accumulators current value, the second being the current element from the array. The return value of the callback function is then used as the accumulator value on the next iteration.

**Objects**

Object values can be accessed using dot notation (`obj.key`) or bracket notation (`obj['key']`). Bracket notation must be used if you are trying to use a variable as the key's name (`obj[key]`). They can also be deleted using the delete keyword (`delete obj.key` or `delete obj['key']`).

Note: Keys must be valid identifier names which means keys that start with numbers can only be accessed using bracket notation as a string `obj['0']` or as a number `obj[0]` the number is automatically coerced into a string.

Keys and values of an object are accessible using the keys and values methods like this: `Object.keys(obj)`, `Object.values(obj)`. An array of nested key/value pairs can be returned with `Object.entries(obj)`.

Note: Key-value pairs are also known as 'properties', with 'property' being the key.

The for/in loop is used to iterate over the properties of an object. The for/of loop is used to iterate over the values of an iterable collection (arrays and strings).

```js
for (let key in obj) {

}
```

Note: for/in will iterate over non-negative integers first even if they dont appear first.

# Understand that arrays are objects, how to determine if you have an array

The typeof operator identifies arrays as "object". The isArray method can be used to check if an object is an array.
`Array.isArray([]) -> true`, `Array.isArray({}) -> false`

Unset/Empty array values have a value of undefined when referenced  but arent actually set to the value undefined. For example, an array with 2 empty items has a length of 2 and referencing the first element like `arr[0]` returns undefined, but passing the array to the keys or values method will return an empty array.

# Variables as pointers

Describes how variables point to a specific place in memory where a value is stored.

Variables that point to primitive values are always stored in different places in memory. Even if one variable is pointing to another variable that contains a primitive value, those 2 variables are pointing to two different places in memory with the same value.

This is because primitive values and the variables that reference them are stored at the same memory location ???????

With objects (and arrays) the variable points to a place in memory which acts as a pointer to a separate place in memory where the value is stored. For example when assigning a variable to another variable that points to an object, the same pointer is assigned to the second variable, which means both variables are now pointing the same value.

# Console.log VS Return

console.log is used to print/display something to the console. This is not the same as the return value of an expression. Expressions evaluate to some kind of value.

`console.log('hi')` prints 'hi' to the console but the expression returns a value of undefined.

# Truthiness: false and true vs falsy and truthy

Any values can be coerced into a boolean. Some values are truthy while others are falsy, this determines which boolean the value will be coerced into/evaluated as.

Everything evaluates as true except for the following falsy values:
* false
* 0, -0, 0n
* '' - empty string
* undefined
* null
* NaN

Note: When using non boolean values with logical && and || operators, the return value is the last operand that was evaluated

# Function definition, invocation, declarations/expressions/arrow

Here is a typical function definition (aka function declaration) starting with the function keyword, followed by the name of the function, then a list of parameters, and finally the the function body:

```js
function sayHi() {
  console.log('Hi');
}
```

Saving a function to a variable is called a function expression and is another way to define a function. If a function definition doesn't start with the word 'function', it is a function expression. Function expressions are NOT declarations.

```js
let sayHi = function() {
  console.log('Hi');
}
```

Shorthand way to write a function expression
Arrow functions are function expressions that can omit an explicit return statement if the function body is not surrounded by curly braces and only contains a single expression.

```js
let say = (message) => message;
say('hi') // returns 'hi'
```

Note: Unlike typical function definition, function expressions cannot be invoked before they appear.

When invoking a function you must use parentheses () otherwise a "function object" will be returned. Invoking a function is the act of calling a function when the program is run.

Any number of arguments can be passed to a function during invocation. Extra arguments will be ignored if you provide too many, and unused parameters will have a value of undefined if you provide too few.

# Implicit return value of function invocations

Functions implicitly return a value of undefined. The "return" keyword must be used to create a return statement that will explicitly return a specific value.

Note: Explicit return statements terminates the function after evaluating the expression then returns the value to the location that invoked it.

Note: Functions that always return true or false are known as predicates.

# First-class functions

Functions are objects and being "first-class" means they can be assigned to variables, passed as arguments, or returned just like any other value.

# Partial function application

This is when a function is returned from another function. That returned function creates a closure that remembers the arguments that were passed into the original function that returned it (they were in scope). Arguments can then be passed into the returned function. The original function is passed less arguments than what is expected from the function that it returns.



This is when a function is returned from another function. The returned function uses the argument(s) passed into the outermost function to partially apply the amount of arguments expected by a third function invocation. The remaining arguments that the third function expects are then passed into the returned function. The amount

Partial function application is when a function returns another function that partially applies the arguments passed into the outermost function to a third function invocation. The remaining arguments that the third function expects are then passed into the returned function.

is when a function returns a second function that applies the argument(s) passed into the first function to an additional third function invocation that expects a greater number of arguments. The arguments passed into the returned function provide the remaining arguments to the third function.

```js
// # function greeter(name, message) {
// #   console.log(`${message} ${name}!`);
// # }

// # function setName(name) {
// #   return function(message) {
// #     greeter(name, message);
// #   }
// # }

// # let setMessage = setName('Cruz');
// # setMessage('Hello');
```

# Side effects

Side effects are certain actions that a function performs. These include non-local variable reassignment, mutation of non-local objects, Iteraction with any system outside of the program (including interacting with the console (logging, getting input, etc)), raising exceptions without handling, and invoking other functions that have side effects.

Regarding raising exceptions, its only a side effect when an exception is raised. The possibility of an exception depending on different factors isn't considered a side effect. A function itself has side effects when it is used as intended, meaning in a way that makes sense, and still has some kind of side effect.

For example, trying to call an array method on a number raises an exception. This doesnt mean the method has a side effect, it means the method is not being used as intended.

# Pure functions and side effects

Pure functions have no side effects and always have a consistent return value, depending on the arguments passed to it. Nothing in a pure function can be affected by outside code, and nothing within the function can affect the outside code.

`let doubler = value => value + value;` passing 2 to this function will consistently return 4.

# Naming conventions (legal vs idiomatic)

idiomatic names are names that follow the proper naming conventions which includes:

* camelCase for most variable and function names. `testCase`
* some functions (constructors) use PascalCase `TestCase`
* SCREAMING_SNAKE_CASE for constants `TEST_CASE`

legal but non idiomatic names are valid names but dont follow proper naming conventions. non idiomatic names are usually used by external libraries.

# Strict mode vs sloppy mode

Strict mode is enabled with "use strict"; at the beginning of a program or function.

Strict mode makes JS throw errors for certain actions that it normally wouldnt, specifically silent errors. Silent errors are when a program will continue to run even if it is doing something thats unintended.

Eliminating some of these silent errors helps to prevent bugs and make debugging easier, optimize code, and avoid future syntax conflicts.

One thing that strict mode prevents is implicitly creating global variables by assigning value to a variable that hasn't been declared. This also helps when variable names are accidently misspelled, instead of creating global variables, an error will be thrown.

Additional strict mode differences:
* prevents declaring two function parameters with the same name.
* prevents using some newer reserved keywords, such as let and static, as variable names.
* prevents you from using the delete operator on a variable name.
* forbids binding of eval and arguments in any way.
* disables access to some properties of the arguments object in functions.
* disables the with statement, a statement whose use is not recommended even in sloppy mode.

In ES5 JavaScript, two additional prohibitions were in effect for strict mode:

* prevents you from using function declarations in blocks.
* prevents declaring two properties with the same name in an object.

# JavaScript syntactic sugar

Object Destructuring lets you perform multiple assignments within the same expression.

```js
let obj = {
  foo: "foo",
  bar: "bar",
  qux: 42,
};

let { foo, bar, qux } = obj;
```

Destructuring also works with arrays

```js
let foo = [1, 2, 3];
let [ first, second, third ] = foo;


```
# Preparations

Node.js is a runtime environment that turns JavaScript into a general purpose
programming language.

// for single line comment
/*
for multiline comment
*/

camelCase for variable/most function names
PascalCase for constructor functions

end lines with ; unless blank line or line ends with { or }

instance methods vs static methods
instance methods are applied to a value of the type
that the constructor represents (equivalent to invoking a method on an instance of a class in ruby).

Example: String.prototype.concat is an instance method which means
that the concat method can be applied to values of the String constructor.

static methods are called on the constructor name instead of a value (equivalent to ruby class methods being called on the class itself)

Example: String.fromCharCode(97) # = 'a'

Ruby equivalents ???
functions -> methods
constructor -> class
constructor functions -> class/instance methods

# The Basics

JS has 5 primitive data types: String, Number, Undefined, Null, Boolean
All other types are object types

Values are represented by literals which is a representation of a fixed value
in source code. Example: 'Hello' is a string literal

Expressions evaluate to values, statements dont. You cannot use a statement as part of an expression.

Strings

String interpolation is accomplished through template literals like this:
5 plus 5 is ${5 + 5} surrounded in backticks ` and doesnt work in single or double
quoted strings. With string concatenation, if either operand is a string and the other
is not, JS will use implicit type coercion to convert the non-string to string.

Numbers

Number data type represents ALL kinds of numbers including floats and decimals.
Some arithmetic operations return the value NaN (Not a Number) when an illegal
operation is performed on numbers (like 0/0)

parseInt function returns an integer from a string example: parseInt('3asdf') => 3
parseFloat('3.14asdf') => 3.14

Numbers can also be coerced into strings like this String(20) => '20'

true is coerced to the number 1, false is coerced to number 0

the plus operator converts a value into a number following the same rules as the Number function +(true) is 1, +(false) is 0, +('string') is NaN +('5') is 5 etc.

When both operands are a combination of numbers, booleans, nulls, or undefineds, they are converted to numbers and added together:

Booleans

Two boolean literal values: true and false

Undefined

Absence of value (equivalent to ruby nil). The literal `undefined` can be explicitly
used. console.log function returns undefined. null is similar to undefined, it represents
the absence of value, the difference is null must be used explicitly. example: let foo = null

The typeof Operator

Returns a string containing the type of its operand's value. Similar to ruby .class method.

NaN is the only value in JS that returns false when compared with itself.

# Pass By Value/Reference

When passing primitive values to functions, JS acts like pass-by-value since we know no operation can be performed on those arguments that would mutate the original value (since primitives are immutable). Objects and arrays passed as arguments could be called pass-by-value-of-the-reference. Functions/methods that mutate callers are called destructive.

# Data Structures

Arrays - basically the same as ruby arrays
Objects - aka hashes (key value pairs) keys are referenced as strings

# Variables

let var = 'hello' is combining the variable declaration with an initializer.
variable assignment is a standalone expression.

let var; - DECLARATION
var = 'hi'; - ASSIGNMENT
let var = 'hi' - DECLARATION WITH AN INITIALIZER

Once a constant is declared, it cannot be assigned to a new value. (which means it must be initialized to a value on declaration).
Global variables are available throughout a program. A variable declared outside
of a function or block has global scope and is accessible everywhere. GLobal variables can
even be reassigned from within functions.

Local variables have local scope (you cant access them outside the function or block
that declares them).

Lexical scope determines the scope of variables based on the source code. The scope exists even if the code isn't executed.

# Closures

When a function encounters a variable name, it first looks locally for that variable name, it then looks inside the closure for the name. The closure contains pointers to variables that are in scope of the functions definition point.

# Functions

Functions are like ruby methods. Function names are usually global variables.
Function parameters are local variables only availiable within the body of the function.
Additional arguments passed to a function (more than required) will be ignored.
Too few and the missing arguments will have a value of undefined.

Functions have an implicit return value of undefined. Use return to specify an
explicit return value. Note: explicit return terminate the function and returns
the value to where it was called.

Functions that always return a boolean value are called predicates.

Passing the return value of a function invocation as an argument to another
function is called function composition. (similar to ruby method chaining)

Functions can be called before declaring them.

A function saved to a variable is called a function expression. These cannot be
invoked before declaring them.

JS functions are first-class functions meaning they can be treated like any other
value. (example assigned to a variable). JS functions are objects.

Functions vs methods???????

Is a function expression just another way of writing a function declaration????

# Hoisting

var creates a property on the gobal object while let does not, which can help to avoid conflicts and bugs, which is safer. declaring a variable with var inside a function will not store the variable as a property of the global object.

**let is block scoped while var is function scoped**. a function scoped variable is available anywhere in the function even if it was declared in an inner scope (block). a block scoped variable is only available within the block where it was declared.

All declarations create variables that have function scope (var, function) or block scope (let, const, class). declared scope refers to how a variable is declared and visibility scope refers to the visibility of a variable. Visibility refers to either global or local scope, so a variable declared with let can have function scope when talking about visibility if it was declared inside a function.

* What is hoisting?
During the creation phase (before the execution phase) JS finds all variables functions and class declarations by seemingly moving them to the top of the functions or blocks where they were declared. Hoisting doesnt actually change anything in the program, it simply executes the program
in a way that declarations come first.

How do var, let, and const interact with hoisting? How do they differ?
When variables declared with var are hoisted, they are given an initial value of undefined.
When variables declared with let or const are hoisted, they are in a "unset" state and are considered to tbe in the Temporal Dead Zone (TDZ).

How do functions and classes interact with hoisting? How do they differ?
The entire function declaration and body is hoisted to the top of the scope. Asume that function declarations are hoisted before (above) variable declarations. A let or const variable cant have the same name as a function

What part does hoisting play in the way a specific program works?

How does hoisting really work?
During the creation phase, variable identifiers are added to either the global or local scope

# Mutability

Primitive values are immutable, any operation performed on them will return
new values. Arrays and objects are mutable. JS is pass by value for primitive values
and pass by reference with objects and arrays.

# Flow control

The === operator is the strict equality operator and checks if two operands have the
same value and are of the same type. '5' === 5 # false

!== strictly inequality operator returns false when operands have the same type and value, otherwise true.

The == operator is the non-strict equality operator (loose equality operator) and
attempts to coerce one operand to the other operands type before making a comparison.
'5' == 5 # true

!= non-strict inequality operator (loose inequality operator) attemps to corece one
operand to the other operand type before make a comparison.

Nullish coalescing operator (??) evalutes to the right hand operand if the left hand
operand is nullish (null or undefined) otherwise it evalutes to the value of the left hand
operand.

A switch statement compares a single value against multiple values for strict equality whereas
an if statement can test multiple expressions with any condition.

```js
let a = 5;

switch (a) {
  case 5:
    console.log('a is 5');
    break;
  case 6:
    console.log('a is 6');
    break;
  default:
    console.log('a is neither 5, nor 6');
    break;
} // => a is 5

```

# Truthiness

JS treats all values as truthy except for: false, 0, '', undefined, null, NaN

# Arrays

If an array is assigned to a constant, the array object cant be changed but the
elements inside can. Use the .freeze method on the array if you dont want the
elements to be changed either. (only works one level deep, sub array elements can still be changed).

.push method adds an element to the end of the array. concat method concatenates
two arrays and returns a brand new array.

splice(3, 2) method removes 2 elements starting at the 3 index in this example.

Clarification on callback??

filter is equivalent to ruby select

arrays are only equal to each other if they are the same object.

Regarding arrays, a property name counts as an array index when it is a non-negative integer. Logging an array logs only the value if its an element (non-negative integer index determins that), otherwise it logs the key value pair

When creating a shallow copy of an array using slice or spread, this creates a new object for the outer most (top level) array only, nested arrays/objects are not copies

# Objects

key/value pairs (aka properties) stored in {}

values can be accessed by dot notation (person.name) or bracket notation (person['name'])

pairs can be deleted using the delete keyword (delete person.age) or (delete person['age']). delete returns true unless it cant delete the property.

during iteration, bracket notation (person[prop]) has to be used since prop is a local variable that points to the current key, it isnt the key itself.

Object.keys returns an array of keys

Object.values returns an array of values

Object.entries returns an array of nested arrays with each nested array containing the key and value

Object.assign(obj1, obj2) merges two or more objects, it mutates the first object.  Use an empty object as the first argument to create a new object.

assign method only creates a shallow copy of the object, any changes to nested objects within the copy will be reflected in the original.

The only way to create a deep copy of an array object is:
```js
let arr = [{ b: 'foo' }, ['bar']];
let serializedArr = JSON.stringify(arr);
let deepCopiedArr = JSON.parse(serializedArr);
```

# for/in and for/of

only use for/in on objects. dont use it on arrays (even though it works). results are unexpected.

```js
let obj = { foo: 1, bar: 2, qux: 'c' };
for (let key in obj) {
  console.log(key);
}
// Output:  foo
//          bar
//          qux
```

use for/of to iterate over an array OR strings

```js
let arr = [ 10, 20, 30 ]
for (let value of arr) {
  console.log(value);
}
// Output:  10
//          20
//          30

let str = "abc";
for (let char of str) {
  console.log(char);
}
// Output: a
//         b
//         c
```

# Math and Dates

```js
> Math.sqrt(36)
= 6

> Math.sqrt(2)
= 1.4142135623730951

> let date = new Date('December 25, 2012')
> date.getDay()
= 2
```
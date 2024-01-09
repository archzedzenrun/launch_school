# Concise Property Initializers

```js
// We just use the name for the property to initialize and JS looks for
// variables with the same name to use as values.

function xyzzy(foo, bar, qux) {
  return {
    foo,
    bar,
    qux,
  };
}

// Ordinary initializers can also be used like this:

function xyzzy(foo, bar, qux) {
  return {
    foo,
    bar,
    answer: qux,
  };
}
```

# Concise Methods

```js
let obj = {
  foo() { // instead of foo: function()
    // do something
  },

  bar(arg1, arg2) { // instead of bar: function(arg1, arg2)
    // do something else with arg1 and arg2
  },
}
```

# Object Destructuring

```js
// Instead of:
let obj = {
  foo: "foo",
  bar: "bar",
  qux: 42,
};

let foo = obj.foo;
let bar = obj.bar;
let qux = obj.qux;

// We can do:
let { foo, bar, qux } = obj;
// Order is not important

// We can also change the variable names to the value of a certain property like:
let { qux, foo: myFoo } = obj;

// It can be used with function parameters like this:
function xyzzy({ foo, bar, qux }) {
  console.log(qux); // 3
  console.log(bar); // 2
  console.log(foo); // 1
}

let obj = {
  foo: 1,
  bar: 2,
  qux: 3,
};

xyzzy(obj);
```

# Array Destructuring

```js
// spaces between brackets distinguish destructuring and array literals
let foo = [1, 2, 3]; // array literal
let [ first, second, third ] = foo; // destructuring
console.log(first, second, third) // 1, 2, 3

// Elements can be skipped by leaving empty spaces like this:
let foo = [1, 2, 3];
let [ first, , third ] = foo;
console.log(first, third) // 1, 3
```

```js
// Performing multiple assignments in a single expression with array destructuring:
let first = 1;
let second = 2;
let third = 3;

let [ num1, num2, num3 ] = [first, second, third];
console.log(num1, num2, num3) // 1, 2, 3

// This is useful for swapping variable values
let one = 1;
let two = 2;

[ one, two ] =  [two, one];
console.log(one, two) // 2, 1

// Rest syntax in array destructuring can assign the rest of an array to a variable
let nums = [1, 2, 3, 4];
let [ one, ...rest] = nums;
console.log(one, rest); // 1, [2, 3, 4]
```

# Spread Syntax

```js
// Can be used to pass any number of arguments in an array to a function like:
function add3(one, two, three) {
  return one + two + three;
}

let nums = [1, 2, 3];
add3(...nums); // 6

// Can be used to clone an array
let foo = [1, 2, 3];
let bar = [...foo];
console.log(bar);         // [1, 2, 3]
console.log(foo === bar); // false

// Can be used to concatenate arrays
let foo = [1, 2, 3];
let bar = [4, 5, 6];
let qux = [...foo, ...bar];
qux; // [1, 2, 3, 4, 5, 6]

// Insert arrays into other arrays
let foo = [1, 2, 3];
let bar = [4, ...foo, 6]
bar; // [4, 1, 2, 3, 6]

// It also works with cloning
let foo = { qux: 1, baz: 2 };
let bar = { ...foo };
console.log(bar); // { qux: 1, baz: 2 }
console.log(foo === bar); // false

// And merging objects
let foo = { qux: 1, baz: 2 };
let xyz = { baz: 3, sup: 4 };
let obj = { ...foo, ...xyz };
obj;  // => { qux: 1, baz: 3, sup: 4 }
```

# Rest Syntax
```js
// With Arrays
let tools = ['hammer', 'screwdriver', 'saw', 'nails'];
let [ ham, ...otherTools ] = tools;
console.log(ham, otherTools); // hammer [ 'screwdriver', 'saw', 'nails' ]

// With Objects
let foo = {bar: 1, qux: 2, baz: 3, xyz: 4};
let { bar, baz, ...otherStuff } = foo;
console.log(bar);        // 1
console.log(baz);        // 3
console.log(otherStuff); // {qux: 2, xyz: 4}
```
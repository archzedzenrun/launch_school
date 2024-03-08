# Objects

Collaborator objects are objects or other values stored as state within another objects properties. They represent connections between different parts of the program.

Objects are used as a way to structure and organize related data, when multiple instances are needed of the same thing, and become more useful as programs grow in size.

### Object Factories

Object factories are functions that return new objects.

# Determining/Setting function execution context (this)

**this**

Every function has an assigned context when it executes. Context is automatically assigned when a function is invoked using ().

`this` is the execution context of a function

During method execution, `this` refers to the calling object.

**Global Object**

When a program runs, JS automatically creates a global object. This object serves as the implicit execution context. In browsers, the `window` object is the global object.

Function and var declarations are added as properties to the global object. Only undeclared variables can be deleted from the global object.

### Implicit Execution Context

This is the context for functions when an explicit context is not provided. The implicit execution context is the global object (window in browsers) and undefined in strict mode.

Note: Even though the IEC is set to `undefined` in strict mode, `this` still refers to the global object.

The binding of an execution context to a function occurs when the function is executed, not when it is defined.

The implicit execution context for methods is the calling object.

### Explicit Execution Context

We can bind an explicit execution context to a function by using the `call` and `apply` methods. `this` within the function will refer to the argument passed to the method.

The difference between `call` and `apply` is `call` takes a list of additional arguments, one after another while `apply` takes an array of additional arguments. (the first argument is the execution context).

The `bind` method can also be used to permanently bind a specific execution context to a function (it creates and returns a copy of the function, bound to the explicit context which can then be executed later). The execution context of the returned function cannot be altered.

### Dealing with context loss

Ways functions can lose context:

**Removing methods from objects and executing the function outside the context of that object.**

How to deal with it?
* Update the function to accept a context argument.
* Restore the context with the call or apply methods.
* Hard binding with the bind method.

**Nested functions losing method context**

Nested function definitions will lose the context of the function they are defined in unless they are explicitly invoked with the same context.

Note: Arrow functions do NOT lose context because their execution context is based on where they are defined.

How to deal with it?
* Save `this` to a variable in the outer function, which can then be referenced from within the nested function.
* Pass the context to the function explicitly using call or apply.
* Use a function expression and `bind` the current context to the function.
* Use an arrow function as previously stated.

**Function as argument losing surrounding context**

Functions as arguments also lose the context of the function they are being used in.

How to deal with it?
* Again, save `this` to a variable in the outer function and reference it from within the function argument.
* Bind the function argument to the surrounding context (this).
* Pass context into the optional 'thisArg' argument. This can be used with functions like forEach, map, filter.
* Use an arrow function.

### Lexical Scope

Lexical scoping is how JS determines where to look for variables. The structure of the code is what determines variable's scope. A functions scope exists even if that function doesnt get executed.  When JS looks for a variable name, it searches the hierarchy of scopes from local up to the global scope and stops and returns the first variable it finds with that name. This can create shadowing issues when variables at different scope levels have the same name.

Functions can access any variable defined within it, as well as any variables that were in scope where the function was defined.

# Scope and Closures

### Higher-order functions

Higher-order functions are functions that accept functions as arguments, return functions, or both.

### Closures and private data

A closure is a function that has access to any variables it needs that were in its lexical scope at the definition point, regardless of where and when the function gets invoked.

Variables that are part of closures are not directly accessible outside of the closure, this is how we can use closures to create private data. Closures allow us to ensure that private data is only accessible by the provided methods. A downside is that the code can be more difficult to extend.

### Garbage collection

Garbage collection is the freeing up or "deallocation" of memory when values are not in use.

JS does this automatically. Objects and primitive values are allocated memory, and then marked eligible for GC and deallocated when there are no longer any references to them.

### Immediately Invoked Function Expressions (IIFEs)

IIFEs are functions that are defined and them immediately invoked.

IIFEs can be used to create functions and objects that have access to private data through closures.

IIFEs have their own private scope which can be useful for avoiding naming conflicts in larger programs.

```js
// Creating an object with private data 
let names = function() {
  let nameList = [];
  return {
    add(name) {
      nameList.push(name);
    },
    list() {
      nameList.forEach(name => console.log(name));
    }
  }
}();

names.add('cruz')
names.list()

// Creating a function with private data
let names = function() {
  let nameList = [];
  return function(name) {
    nameList.push(name)
    console.log(`There are ${nameList.length} names in the list.`)
  }
}();

names('cruz')
names('trish')
names('esther')
```

### Partial Function Application (PFA)

PFA is when a function returns a second function that applies the argument(s) passed into the first function to an additional third function invocation that expects a greater number of arguments. The arguments passed into the returned function provide the remaining arguments to the third function.
```js
function fullName(first, last) {
  return first + ' ' + last;
}

function firstName(func, first) {
  return function(last) {
    return func(first, last);
  }
}

let name = firstName(fullName, 'cruz');
console.log(name('hernandez'));
```

# Object Creation Patterns

### Factory Functions

The Factory Object Creation Pattern is a way to create objects from a function with a template that is pre defined.

Pros:
* Easy to create similar object types

Cons:
* Each object has fully copies of all properties and methods, which can affect performance.
* We have no way of knowing if the objects were created from factory functions, making it difficult to identify object types.

### Constructor Pattern

Constructor functions are meant to be invoked with the `new` operator. These functions are capitalized as convention to show their intent.

When calling a function with `new`:
* A new object is created
* The prototype property of the function is set as the prototype for the new object.
* `this` is set to the newly created object
* The code in the function is executed
* `this` is returned unless you explicitly return another object.

With the constructor pattern, instances of the function also have copies of all the object properties, but we are able to identify what function the object was created from.

### Pseudo-classical Pattern

Combines the constructor and prototype pattern. The constructor function is used to set object states (properties) and shared methods are placed on the constructor functions prototype property.
```js
function Cat(name) {
  this.name = name;
}

Cat.prototype.meow = function() {
  console.log('meow!');
}

let pip = new Cat('pip');
console.log(pip.hasOwnProperty('meow')) // false
pip.meow(); // meow!
```

### Object Linking Other Objects (OLOO)

With this pattern we create the shared behaviors on an object that will be used as the prototype. Then we use `Object.create()` to create objects that delegate from the prototype. An `init` method is often defined on the prototype object to build the state of each object.

```js
let Cat = {
  init(name, color) {
    this.name = name;
    this.color = color;
    return this;
  },
  meow() {
    console.log('meow!');
  }
}

let pip = Object.create(Cat).init('pip', 'grey');
console.log(pip.hasOwnProperty('meow')) // false
pip.meow() // meow!
```

### Prototypes

All JS objects have a special hidden property called `[[Prototype]]` (`__proto__` is the deprecated non hidden version). Using `Object.create(arg)` to create an object sets the hidden property to the object passed in as an argument.

The object Object.prototype is the end of the prototype chain for all JS objects. The methods defined here are accessible by all JS objects.

Functions also have a `prototype` property known as the function prototype. The hidden [[Prototype]] property of any object created from a function references the prototype property of the function that constructed it.

Defining behaviors on a constructor functions prototype property is called the "Prototype Pattern". This allows objects to delegate requests up the prototype chain instead of defining the same behavior on every object.

### Behavior Delegation

Behavior delegation is when objects that are lower on the prototype chain "delegate" requests (properties/behaviors) to objects higher up on the chain where they may be defined.

Objects created from prototypes can override "inherited" behaviors by defining them locally.

### Class Syntax

Class is nothing more than syntactic sugar that wraps around the pseudo classical pattern.

We explicitly define a constructor function that states are set within. This is automatically invoked when objects are created.

All methods defined in the class definition (besides constructor) are defined on the prototype object (of the constructor function).

With class syntax, the `new` operator must be used to create objects.

# Modules

Modules can be used as a way of breaking up large programs into smaller more manageable pieces. Modules also help maintain encapsulation by making it easier to work with private data.

Module scope is an additional scope present in the Node environment. Variables declared at the top level are in "module scope" and are not added to the global object and are only accessible from within that specific file. Node wraps the entire program in a function, so all variables and functions have function scope. The execution context at the top level in node is an empty object {}.
// PP 1
// This will log 1, bar inherits the `a` property from its prototype (foo).

// PP 2
// This will log 2, bar defines its own `a` property.

// PP 3
// We dont know for certain that we are referencing a property owned by boo.
// We can use the hasOwnProperty method on `far` to check if it has a `myProp` property of its own.
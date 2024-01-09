// PP 1
// Unknown until execution time

// PP 2
// window object

// PP 3
// window object

// PP 4
// the object referenced by variable obj

// PP 5
// Error because in this case 'this' references the global context which is undefined (because of strict mode) and we are trying to access the property 'a' of undefined.

// PP 6
// 2

// PP 7
// line 12 outputs the object referenced by foo
// line 14 error because 'this' in the bar function references the global object, where the baz function doesnt exist.
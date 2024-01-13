// PP 1
let prot = {};
let foo = Object.create(prot);

// PP 2
console.log(Object.getPrototypeOf(foo) === prot);

// PP 3
console.log(prot.isPrototypeOf(foo));

// PP 4
// true, prot is a prototype of foo
// true, Object.prototype is at the top of the prototype chain for all objects.
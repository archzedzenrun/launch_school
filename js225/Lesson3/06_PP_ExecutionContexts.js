// PP 1
// window (global browser object)

// PP 2
// undefined, the value of this is undefined in strict mode

// PP 3
// this will output the obj Object because its invoked as a method which means its execution context is the object the function was called on. (obj).

// PP 4
// Line 7 will output "Hello from the global scope!"
// Line 15 will output "Hello from the function scope!"

// PP 5
// Line 14 outputs 20 because the function is invoked in the context of the global(window) scope where var a and let b declarations are.
// Line 15 outputs 0 because the add method is now in the context of the object referenced by c, so this.a refers to the a property which is -10 and b references the globally scoped b on line 2
// the difference between var and let is var creates properties on the global object while let and const dont belong to any object.

// PP 6
// call and apply

// PP 7
let foo = {
  a: 1,
  b: 2,
};

let bar = {
   a: 'abc',
   b: 'def',
   add() {
     return this.a + this.b;
   },
};

console.log(bar.add.call(foo)) // 3

// PP 8
let fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};

function outputList() {
  console.log(arguments)
  console.log(this.title + ':');

  let args = [].slice.call(arguments);

  args.forEach(function(elem) {
    console.log(elem);
  });
}

outputList.apply(fruitsObj, fruitsObj.list);

// PP 9
// To create a "normal" array based on the arguments object (the arguments object is array-like and not iterable)
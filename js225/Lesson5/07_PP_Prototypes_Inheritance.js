// PP 1
function getDefiningObject(object, propKey) { // #DISGUSTING
  if (Object.getPrototypeOf(object) === null &&
    !object.hasOwnProperty(propKey)) return null;

  if (object.hasOwnProperty(propKey)) {
    return object;
  } else {
    return getDefiningObject(Object.getPrototypeOf(object), propKey);
  }
}

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// let baz = Object.create(bar);
// let qux = Object.create(baz);

// bar.c = 3;
// qux.d = 4;

// console.log(getDefiningObject(qux, 'c') === bar);     // => true
// console.log(getDefiningObject(qux, 'e'));             // => null
// console.log(getDefiningObject(qux, 'd') === qux)

// PP 2
function shallowCopy(object) {
  let newObj = Object.create(Object.getPrototypeOf(object));

  for (let prop in object) {
    if (object.hasOwnProperty(prop)) {
      newObj[prop] = object[prop];
    }
  }

  return newObj;
}

// let foo = {
//   a: 1,
//   b: 2,
// };

// let bar = Object.create(foo);
// bar.c = 3;
// bar.say = function() {
//   console.log('c is ' + this.c);
// };

// let baz = shallowCopy(bar);
// console.log(baz.a);       // => 1
// baz.say();                // => c is 3
// console.log(baz.hasOwnProperty('a'));  // false
// console.log(baz.hasOwnProperty('b'));  // false
// console.log(baz.hasOwnProperty('c'));  // true

// PP 3
function extend(destination, ...args) {
  args.forEach(obj => {
    for (let prop in obj) {
      if (obj.hasOwnProperty(prop)) {
        destination[prop] = obj[prop];
      }
    }
  })

  return destination;
}

let foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

let joe = {
  name: 'Joe'
};

let funcs = {
  sayHello() {
    console.log('Hello, ' + this.name);
  },

  sayGoodBye() {
    console.log('Goodbye, ' + this.name);
  },
};

let object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // => 1
object.sayHello();                // => Hello, Joe
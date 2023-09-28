let myProtoObj = {
  foo: 1,
  bar: 2,
};

let myObj = Object.create(myProtoObj);
myObj['qux'] = 3;
console.log(myObj);

// the first snippet will log only the keys associated with myObj because the keys method returns an array of keys associated only with that object.
// the second snippet will log the keys of myObj and the object it inherts from
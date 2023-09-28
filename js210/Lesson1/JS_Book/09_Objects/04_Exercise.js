let obj = {
  b: 2,
  a: 1,
  c: 3,
};

let objKeys = Object.keys(obj);
let upcaseKeys = objKeys.map((letter) => letter.toUpperCase());
console.log(upcaseKeys);
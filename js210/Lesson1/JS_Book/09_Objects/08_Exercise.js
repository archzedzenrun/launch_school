let objToCopy = {
  foo: 1,
  bar: 2,
  qux: 3,
};

function copyObj(ogObj, keysToCopy = []) {
  if (keysToCopy.length === 0) {
    return ogObj;
  }

  let ogObjkeys = Object.keys(ogObj);
  let newObj = {};

  keysToCopy.forEach(function(key) {
    if (ogObjkeys.includes(key)) {
      newObj[key] = ogObj[key];
    }
  })

  return newObj;
}

let newObj = copyObj(objToCopy);
console.log(newObj);        // => { foo: 1, bar: 2, qux: 3 }

let newObj2 = copyObj(objToCopy, [ 'foo', 'qux' ]);
console.log(newObj2);       // => { foo: 1, qux: 3 }

let newObj3 = copyObj(objToCopy, [ 'bar' ]);
console.log(newObj3);       // => { bar: 2 }

console.log(objToCopy);
// function objectsEqual(obj1, obj2) {
//   return String(Object.entries(obj1)) === String(Object.entries(obj2));
// }

function objectsEqual(obj1, obj2) {
  let obj1Entries = Object.entries(obj1);
  for (let i = 0; i < obj1Entries.length; i += 1) {
    let currentKey = obj1Entries[i][0];
    let currentVal = obj1Entries[i][1];
    if (!Object.keys(obj2).includes(currentKey)) {
      return false;
    } else if (!Object.values(obj2).includes(currentVal)) {
      return false;
    }
  }

  return true;
}

console.log(objectsEqual({a: 'foo'}, {a: 'foo'}));                      // true
console.log(objectsEqual({a: 'foo', b: 'bar'}, {a: 'foo'}));            // false
console.log(objectsEqual({}, {}));                                      // true
console.log(objectsEqual({a: 'foo', b: undefined}, {a: 'foo', c: 1}));  // false
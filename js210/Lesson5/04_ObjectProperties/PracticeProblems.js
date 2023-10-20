// Problem 1 ------------------------------------------------------------------
function objectHasProperty(obj, property) {
  return Object.keys(obj).includes(property);
}

let pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

// console.log(objectHasProperty(pets, 'dog'));       // true
// console.log(objectHasProperty(pets, 'lizard'));    // false
// console.log(objectHasProperty(pets, 'mice'));      // true

// Problem 2 ------------------------------------------------------------------
function incrementProperty(obj, property) {
  if (obj[property] === undefined) {
    obj[property] = 1;
  } else {
    obj[property] += 1;
  }

  return obj[property];
}

let wins = {
  steve: 3,
  susie: 4,
};

// console.log(incrementProperty(wins, 'susie'));   // 5
// wins;                               // { steve: 3, susie: 5 }
// console.log(incrementProperty(wins, 'lucy'));    // 1
// wins;                               // { steve: 3, susie: 5, lucy: 1 }

// Problem 3 ------------------------------------------------------------------
function copyProperties(obj1, obj2) {
  let count = 0;
  for (let property in obj1) {
    obj2[property] = obj1[property];
    count += 1;
  }

  return count;
}

let hal = {
  model: 9000,
  enabled: true,
};

let sal = {};
// console.log(copyProperties(hal, sal));  // 2
// console.log(sal);                       // { model: 9000, enabled: true }

// Problem 4 ------------------------------------------------------------------
function wordCount(string) {
  let words = string.split(' ');
  let object = {};

  for (let word of words) {
    if (object[word]) {
      object[word] += 1;
    } else {
      object[word] = 1;
    }
  }

  return object;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
// Problem 1 ------------------------------------------------------------------
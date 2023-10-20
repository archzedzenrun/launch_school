// Welcome Stranger
function greetings(array, object) {
  let name = array.join(' ');
  let job = `${object.title} ${object.occupation}`;
  console.log(`Hello, ${name}! Nice to have a ${job} around.`)
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// Repeated Characters
function repeatedCharacters(string) {
  let counts = {};
  for (let char of string.toLowerCase()) {
    counts[char] ? counts[char] += 1 : counts[char] = 1;
  }

  for (let char in counts) {
    if (counts[char] < 2) delete counts[char];
  }

  return counts;
}

repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
repeatedCharacters('Pet');            // {}
repeatedCharacters('Paper');          // { p: 2 }
repeatedCharacters('Baseless');       // { s: 3, e: 2 }
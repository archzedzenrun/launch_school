let bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]

// ============================================================================

function capitalize(word) {
  return word[0].toUpperCase() + word.slice(1);
}

function removeDots(word) {
  let noDotString = ''

  for (let char of word) {
    if (char !== '.') {
      noDotString += char;
    }
  }

  return noDotString;
}

function processName(name) {
  return name.split(' ').map(word => {
    word = removeDots(word);
    word = capitalize(word);
    return word;
  }).join(' ');
}

function processBands(data) {
  return data.map(band => {
    return { name: processName(band.name),
             country: 'Canada',
             active: band.active,
           };
  });
}

// Alt Solution ===============================================================

// function capitalize(word) {
//   return word[0].toUpperCase() + word.slice(1);
// }

// function removeDots(word) {
//   let noDotString = ''

//   for (let char of word) {
//     if (char !== '.') {
//       noDotString += char;
//     }
//   }

//   return noDotString;
// }

// function updateCountry(band) {
//   band.country = 'Canada';
// }

// function processName(band) {
//   let name = band.name.split(' ');
//   name = name.map(word => {
//     word = removeDots(word);
//     word = capitalize(word);
//     return word;
//   });

//   band.name = name.join(' ');
// }

// function processBands(bands) {
//   bands.forEach(band => {
//     processName(band);
//     updateCountry(band);
//   });

//   return bands;
// }
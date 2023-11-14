let newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

// function idAndTitle(entry) {
//   return entry.id && entry.title
// }

// function filterIdTitle(entry) {
//   let entries = Object.entries(entry);

//   let idTitle= entries.filter(function(info) {
//     if (info[0] === 'id' || info[0] === 'title') {
//       return info;
//     }
//   })

//   return Object.fromEntries(idTitle);
// }

// function processReleaseData(data) {
//   let processedData = [];

//   for (let i = 0; i < data.length; i += 1) {
//     let currentEntry = data[i];
//     if (idAndTitle(currentEntry)) {
//       processedData.push(filterIdTitle(currentEntry));
//     }
//   }

//   return processedData;
// }

console.log(processReleaseData(newReleases));

// should return:
// [{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }];

function processReleaseData(data) {
  let filteredData = data.filter(entry => entry.id && entry.title);
  return filteredData.map(entry => {
     return { id: entry.id, title: entry.title };
  });
}

// Further Exploration:

// function processReleaseData(data) {
//   let filteredData = data.filter(entry => entry.id >= 0 && entry.title);
//   return filteredData.map(entry => ({ id: entry.id, title: entry.title }));
// }
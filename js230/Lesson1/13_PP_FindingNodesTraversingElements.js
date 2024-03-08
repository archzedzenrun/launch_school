// PP 1
let h2 = document.querySelectorAll('h2');
let counts = Array.from(h2).map(head => head.textContent.split(' ').length);
console.log(counts);

// PP 2
document.querySelector('.toc');
document.querySelector('#toc');
document.getElementsByClassName('toc');
document.getElementById('toc');
document.querySelectorAll('.toc')[0];

// PP 3
let toc = document.querySelector('#toc');
let links = Array.from(toc.querySelectorAll('a'));
// let toc = document.querySelectorAll('.toc a') works too

links.forEach((link, idx) => {
  if (idx % 2 === 1) {
    link.style.color = 'green';
  }
});

// PP 4
let captions = document.querySelectorAll('.thumbcaption');
[...captions].map(caption => caption.textContent.trim());

// PP 5
let ranks = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];

let tr = document.querySelectorAll('.biota tr');
let classifications = {};

Array.from(tr).forEach(entry => {
  let key = entry.children[0];
  let keyText = key.textContent.slice(0, -1);
  if (ranks.includes(keyText)) {
    classifications[keyText] = key.nextElementSibling.textContent;
  }
});

console.log(classifications);

/* USING REDUCE
let ranks = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];

let tr = document.querySelectorAll('.biota tr');

let result = Array.from(tr).reduce((classifications, entry) => {
  let key = entry.children[0];
  let keyText = key.textContent.slice(0, -1);
  if (ranks.includes(keyText)) {
    classifications[keyText] = key.nextElementSibling.textContent;
  }

  return classifications
}, {});

console.log(result);
*/
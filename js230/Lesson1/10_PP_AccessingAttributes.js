// PP 1
let h1 = document.lastChild.lastChild.childNodes[1];
h1.style.color = 'red';
h1.style.fontSize = '48px';

// PP 2
let children = document.body.childNodes;
Array.from(children).filter(node => {
  return node.nodeName === 'P';
}).length;

// PP 3
let p = Array.from(children).filter(node => node.nodeName === 'P');
p.map(pNode => {
  return pNode.firstChild.data.trim().split(' ')[0];
});

// PP 4
p.forEach((pNode, idx) => {
  if (idx !== 0) pNode.className = 'stanza';
});

// PP 5
function walk(node, func) {
  for (let i = 0; i < node.childNodes.length; i += 1) {
    let current = node.childNodes[i];
    func(current);
    walk(current, func);
  }
}

function getImg() {
  let img = [];

  walk(document, function(node) {
    if (node.nodeName === 'IMG') {
      img.push(node);
    }
  });

  return img;
}

console.log(`IMG count: ${getImg().length}`); // 48
let png = getImg().filter(img => img.src.endsWith('.png')).length;
console.log(`PNG count: ${png}`); // 23

// PP 6
walk(document, function(node) {
  if (node.nodeName === 'A') {
    node.style.color = 'red';
  }
});
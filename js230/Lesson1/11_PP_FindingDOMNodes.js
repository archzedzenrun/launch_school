// Group 1
// PP 1
function p() {
  return [...document.body.childNodes].filter(node => {
    return node.nodeName === 'P';
  });
}

// PP 2
function addClassToP(node) {
  if (node.nodeName === 'P') {
    node.classList.add('article-text');
  }

  for (let i = 0; i < node.childNodes.length; i += 1) {
    let current = node.childNodes[i];
    addClassToP(current);
  }
}

addClassToP(document);

// PP 3
function getElementsByTagName(tag) {
  let tags = [];

  function traverse(node) {
    for (let i = 0; i < node.childNodes.length; i += 1) {
      let current = node.childNodes[i];
      if (current.nodeName.toLowerCase() === tag) {
        tags.push(current);
      }

      traverse(current);
    }
  }

  traverse(document);
  return tags;
}

getElementsByTagName('p').forEach(tag => {
  tag.classList.add('article-text');
});

// Group 2
// PP 1
[...document.getElementsByTagName('p')].forEach(p => {
  p.classList.add('article-text');
});

// PP 2
let divs = [...document.getElementsByClassName('intro')];
divs.forEach(div => {
  let p = div.getElementsByTagName('p');
  [...p].forEach(pEle => pEle.classList.add('article-text'));
})
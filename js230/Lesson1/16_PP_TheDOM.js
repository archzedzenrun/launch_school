// PP 1
let h1 = document.getElementById('primary_heading');
h1.classList.add('heading');

// PP 2
let list = document.getElementById('list');
list.classList.add('bulleted');

// PP 3
let link = document.getElementById('toggle');
link.onclick = function(e) {
  e.preventDefault();
  let notice = document.getElementById('notice');
  if (notice.className === 'hidden') {
    notice.className = 'visible';
  } else {
    notice.className = 'hidden';
  }
}

// PP 4
let notice = document.getElementById('notice');
notice.onclick = function(e) {
  e.preventDefault();
  e.currentTarget.className = 'hidden';
}

// PP 5
document.getElementById('multiplication').innerText = String(13 * 9);

// PP 6
document.body.setAttribute('id', 'styled'); // or...
document.body.id = 'styled';
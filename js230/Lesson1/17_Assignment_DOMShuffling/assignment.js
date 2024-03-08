let header = document.querySelectorAll('header')[1];
let main = document.querySelector('main');
document.body.insertBefore(header, main);

let h1 = document.querySelectorAll('h1')[0];
header.insertBefore(h1, header.firstElementChild);

let article = document.querySelector('article');
let figures = [...document.querySelectorAll('figure')];
figures.reverse().forEach(figure => {
  article.appendChild(figure);
});
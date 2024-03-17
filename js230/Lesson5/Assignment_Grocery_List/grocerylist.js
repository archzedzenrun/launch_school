document.addEventListener('DOMContentLoaded', () => {
  let list = document.getElementById('list');
  let form = document.querySelector('form');
  form.addEventListener('submit', event => {
    event.preventDefault();
    
    let name = document.getElementById('name'); 
    let quantity = document.getElementById('quantity');
    if (quantity.value === '') quantity.value = 1;

    let listItem = document.createElement('li');
    listItem.textContent = quantity.value + ' ' + name.value;
    list.appendChild(listItem);

    form.reset();
  });
});
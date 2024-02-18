document.addEventListener('DOMContentLoaded', () => {
  let textField = document.querySelector('.text-field');
  let content = document.querySelector('.content');
  let cursor;

  textField.addEventListener('click', event => {
    event.stopPropagation();
    textField.classList.add('focused');
    if (!cursor) {
      cursor = setInterval(function() {
        textField.classList.toggle('cursor');
      }, 500);
    }
  });

  document.addEventListener('keydown', event => {
    if (textField.classList.contains('focused')) {
      if (event.key === 'Backspace') {
        content.textContent = content.textContent.slice(0, content.textContent.length - 1)
      } else {
        content.textContent += event.key;
      }
    }
  });
  
  document.addEventListener('click', event => {
    clearInterval(cursor);
    cursor = null;
    if (textField.classList.contains('focused')) {
      textField.classList.remove('focused');
      textField.classList.remove('cursor');
    }
  });
});

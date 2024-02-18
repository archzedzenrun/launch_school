document.addEventListener('DOMContentLoaded', () => {
  let form = document.querySelector('form');
  let input = document.querySelector('#guess');
  let paragraph = document.querySelector('p');
  let button = document.querySelector('[type="submit"]');
  let answer;
  let guesses;

  function newGame() {
    answer = Math.floor(Math.random() * 5) + 1;
    guesses = 0;
    paragraph.textContent = 'Guess a number between 1 and 100';
    button.disabled = false;
  }

  newGame();

  form.addEventListener('submit', event => {
    event.preventDefault();
    let guess = parseInt(input.value, 10);
    let message;
  
    if (Number.isNaN(guess)) {
      message = `Invalid number`;
    } else {
      guesses += 1;
      if (guess > answer) {
        message = `Number is lower than ${guess}`;
      } else if (guess < answer) {
        message = `Number is higher than ${guess}`;
      } else {
        // let button = document.querySelector('fieldset').childNodes[3]
        button.disabled = true;
        // button.style.background = 'red';
        // button.style['box-shadow'] = '10px 5px 5px #780e24';
        message = `You guessed the right number in ${guesses} guesses!`;
      }
    }

    paragraph.textContent = message;
  });

  document.querySelector('a').addEventListener('click', event => {
    event.preventDefault();
    newGame();
  });
});
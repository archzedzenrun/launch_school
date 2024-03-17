document.addEventListener('DOMContentLoaded', () => {
  let result = document.getElementById('result');
  let form = document.querySelector('form');
  
  function performOperation(op, num1, num2) {
    num1 = Number(num1);
    num2 = Number(num2);
    let result;

    if (op === '+') {
      result = num1 + num2;
    } else if (op === '-') {
      result = num1 - num2;
    } else if (op === '*') {
      result = num1 * num2;
    } else {
      result = num1 / num2;
    }

    return Number.isInteger(result) ? result : result.toFixed(1);
  }
  
  form.addEventListener('submit', event => {
    event.preventDefault();
    let input1 = form.children[0].value;
    let input2 = form.children[2].value;
    let operation = form[1].value;
    result.textContent = performOperation(operation, input1, input2);
  });
});
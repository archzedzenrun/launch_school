let counter;

function startCounting() {
  let num = 1;
  counter = setInterval(function() {
    console.log(num)
    num += 1;
  }, 1000);
}

function stopCounting() {
  clearInterval(counter);
}
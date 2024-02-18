// PP 1
function basicCallback(callback, number) {
  setTimeout(function() {
    callback(number);
  }, 2000);
}

// Example usage:
basicCallback((number) => {
  console.log(number * 2);
}, 5);
// After 2 seconds, logs: 10

// PP 2
function downloadFile(callback) {
  console.log('Downloading file...');
  setTimeout(() => {
    callback('Download complete!')
  }, 1500);
}

downloadFile((msg) => console.log(msg));

// PP 3
function processData(array, callback) {
  setTimeout(() => {
    console.log(array.map(callback));
  }, 1000);
}

// Example usage:
processData([1, 2, 3], (number) => number * 2);
// After 1 second, logs: [2, 4, 6]

// PP 4
function waterfallOverCallbacks(array, num) {
  for (let i = 0; i < array.length; i += 1) {
    num = array[i](num);
  }
  console.log(num);
}

// Example usage:
const double = (x) => x * 2;
waterfallOverCallbacks([double, double, double], 1);
// Logs: 8

// Example usage:
function startCounter(callback) {
  let counter = 1;
  let interval = setInterval(() => {
    if (callback(counter)) {
      clearInterval(interval);
    }
    counter += 1;
  }, 1000);
}

startCounter((count) => {
  console.log(count);
  return count === 5;
});
// Logs 1, 2, 3, 4, 5, then stops
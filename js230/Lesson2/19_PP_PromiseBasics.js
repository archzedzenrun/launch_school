// PP 1
function downloadFilePromise() {
  return new Promise(function(resolve) {
    console.log('Downloading file...');
    setTimeout(() => {
      resolve('Download complete!');
    }, 1500);
  }).then(function(result) {
    console.log(result);
  })
}

downloadFilePromise();

// PP 2
function processDataPromise(array, callback) {
  return new Promise(function(resolve) {
    setTimeout(() => {
      resolve(array.map(callback));
    }, 1000);
  });
}

// Example usage:
processDataPromise([1, 2, 3], function(num) {
  return num * 2;
}).then((processedNumbers) => {
  console.log(processedNumbers);
  // After 1 second, logs: [2, 4, 6]
});

// PP 3
function flakyService() {
  return new Promise(function(resolve, reject) {
    let num = Math.random();
    num > 0.5 ? resolve('Operation successful') : reject('Operation failed');
  });
}

flakyService().then((resolve) => {
  console.log(resolve);
}).catch((reject) => {
  console.log(reject);
})

// PP 4
function operation() {
  return new Promise(function(resolve, reject) {
    console.log('Operation started');
    setTimeout(() => {
      resolve('Operation complete');
    }, 1000);
  });
}

operation().then(console.log).finally(() => {
  console.log('Cleaning up');
})

// PP 5
new Promise((resolve) => {
  resolve(2);
}).then((num) => {
  return new Promise((resolve) => {
    resolve(num * 2);
  })
}).then((num) => {
  return new Promise((resolve) => { 
    resolve(num + 5);
  })
}).then((result) => {
  console.log(result);
})

// LS solution
Promise.resolve(2).then((num) => {
  return num * 2;
}).then((num) => {
  return num + 5;
}).then((num) => {
  console.log(num);
})
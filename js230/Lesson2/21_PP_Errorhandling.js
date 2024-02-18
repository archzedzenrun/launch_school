// PP 1
function flakyService() {
  return new Promise(function(resolve, reject) {
    let num = Math.random();
    return num > 0.5 ? resolve('Operation successful') : reject('Operation failed');
  });
}

flakyService().then((resolve) => {
  console.log(resolve);
}).catch(() => {
  console.error('An error occurred');
})

// PP 2
function fetchUserData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => reject({ error: "User not found" }), 500);
  });
}

fetchUserData().catch((rejection) => {
  console.error(rejection.error);
}).finally(() => {
  console.log('Fetching complete');
});

// PP 3
function retryOperation(operationFunc) {
  let attempts = 0
  
  function attempt() {
    return operationFunc().catch((err) => {
      if (attempts < 2) {
        attempts += 1;
        console.log(`Retry attempt #${attempts}`);
        return attempt();
      } else {
        throw err;
      }
    });
  }

  return attempt().catch(() => console.error("Operation failed"));
}

// Example usage:
retryOperation(
  () =>
    new Promise((resolve, reject) =>
      Math.random() > 0.33
        ? resolve("Success!")
        : reject(new Error("Fail!"))
    )
);

// PP 4
function mockAsyncOp() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (Math.random() > 0.5) {
        resolve("Operation succeeded");
      } else {
        reject("Operation failed");
      }
    }, 1000);
  });
}

mockAsyncOp().then(console.log).catch(console.error).finally(() => console.log('Operation attempted'));

// PP 5
function loadData() {
  return new Promise((resolve, reject) => {
    if (Math.random() > 0.50) {
      resolve('Data loaded');
    } else {
      reject('Network error');
    }
  }).catch((err) => {
    console.error(`${err}, attempting to recover...`);
    return Promise.resolve('Using cached data');
  });
}

loadData().then(console.log);
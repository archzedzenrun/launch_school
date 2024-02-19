// PP 1
async function downloadFilePromise() {
  console.log('Downloading file...');
  let message = await new Promise((resolve) => {
    setTimeout(() => {
      resolve("Download complete!");
    }, 1500);
  });

  console.log(message);
}

downloadFilePromise();

// PP 2
async function loadData() {
  try {
    let message = await new Promise((resolve, reject) => {
      setTimeout(() => {
        if (Math.random() > 0.5) {
          resolve('Data loaded');
        } else {
          reject('Network error');
        }
      }, 1000);
    });

    console.log(message);
  } catch(error) {
    console.error(error);
  }
}

loadData();

// PP 3
async function fetchResource(url) {
  try {
    let response = await fetch(url);
    let data = await response.json();
    console.log(data);
  } catch (error) {
    console.error('Failed to load resource');
  } finally {
    console.log('Resource fetch attempt made');
  }
}

fetchResource("https://jsonplaceholder.typicode.com/todos/1");

// PP 4
async function fetchUserProfile() {
  try {
    let profile = await fetch('https://jsonplaceholder.typicode.com/users/1');
    let data = await profile.json();
    console.log(data);
  } catch (error) {
    console.error(error);
  }

  try {
    let posts = await fetch('https://jsonplaceholder.typicode.com/users/1/posts');
    let data = await posts.json();
    console.log(data);
  } catch (error) {
    console.error(error);
  }

  try {
    let comments = await fetch('https://jsonplaceholder.typicode.com/users/1/comments');
    let data = await comments.json();
    console.log(data);
  } catch (error) {
    console.error(error);
  }
}

fetchUserProfile();
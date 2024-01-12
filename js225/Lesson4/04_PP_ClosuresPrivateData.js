// PP 1
function makeCounterLogger(start) {
  return function(end) {
    if (start < end) {
      for (let n = start; n <= end; n += 1) {
        console.log(n);
      }
    } else {
      for (let n = start; n >= end; n -= 1) {
        console.log(n);
      }
    }
  }
}

// let countlog = makeCounterLogger(5);
// countlog(8);
// countlog(2);

// PP 2
function makeList() {
  let list = [];
  return function(todo) {
    if (todo === undefined) {
      if (list.length > 1) {
        list.forEach(item => console.log(item));
      } else {
        console.log('The list is empty.');
      }
    } else if (list.includes(todo)) {
      list.splice(list.indexOf(todo), 1);
      console.log(`${todo} removed!`);
    } else {
      list.push(todo);
      console.log(`${todo} added!`);
    }
  }
}

let list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('make breakfast');
list();
// Problem 1 ------------------------------------------------------------------
let today = new Date();
console.log(today);

// Problem 2 ------------------------------------------------------------------
console.log(`Today's day is ${today.getDay()}`);

// Problem 3 ------------------------------------------------------------------
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
console.log(`Today's day is ${daysOfWeek[today.getDay()]}`);

// Problem 4 ------------------------------------------------------------------
let day = daysOfWeek[today.getDay()];
let date = today.getDate();
console.log(`Today's day is ${day}, the ${date}th.`);

// Problem 5 ------------------------------------------------------------------
function dateSuffix(day) {
  switch(day) {
    case 1: return String(day) + 'st';
    case 2: return String(day) + 'nd';
    case 3: return String(day) + 'rd';
    default: return String(day) + 'th';
  }
}

console.log(`Today's day is ${day}, the ${dateSuffix(date)}.`);

// Problem 6 ------------------------------------------------------------------
console.log(`Today's date is ${day}, ${today.getMonth()} ${dateSuffix(date)}.`);

// Problem 7 ------------------------------------------------------------------
let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
let month = today.getMonth();
console.log(`Today's date is ${day}, ${months[month]} ${dateSuffix(date)}.`);

// Problem 8 ------------------------------------------------------------------
function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDay(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  return daysOfWeek[date.getDay()];
}

function formattedDate(date) {
  let month = formattedMonth(date);
  let day = formattedDay(date);
  let suffix = dateSuffix(date.getDate());
  return `Today's date is ${day}, ${month} ${suffix}.`;
}

console.log(formattedDate(today));

// Problem 9 ------------------------------------------------------------------
console.log(today.getFullYear());
console.log(today.getYear());

// Problem 10 -----------------------------------------------------------------
console.log(today.getTime());

// Problem 11 -----------------------------------------------------------------
let tomorrow = new Date(today.getTime());
tomorrow.setDate(today.getDate() + 1);
console.log(formattedDate(tomorrow));

// Problem 12 -----------------------------------------------------------------
let nextWeek = new Date(today.getTime());
console.log(nextWeek === today); // False because they are different objects

// Problem 13 -----------------------------------------------------------------
console.log(nextWeek.toDateString() === today.toDateString()); // True
nextWeek.setDate(today.getDay() + 7);
console.log(nextWeek.toDateString() === today.toDateString()); // False

// Problem 14 -----------------------------------------------------------------
function formatTime(date) {
  let minutes = String(date.getMinutes());
  let hours = String(date.getHours());
  if (minutes.length === 1) minutes = `0${minutes}`;
  if (hours.length === 1) hours = `0${hours}`;

  return `${hours}:${minutes}`;
}

console.log(formatTime(nextWeek));
console.log(formatTime(new Date(2013, 2, 1, 1, 10)));
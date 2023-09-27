let readlineSync = require('readline-sync');

function futureAge(age) {
  console.log(`You are ${age} years old.`)
  for (let years = 10; years <= 40; years += 10) {
    console.log(`In ${years} years, you will be ${age + years} years old.`);
  }
}

futureAge(Number(readlineSync.question('How old are you? ')));
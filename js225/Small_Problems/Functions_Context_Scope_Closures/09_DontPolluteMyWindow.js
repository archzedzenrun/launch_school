// const name = 'Naveed';
// const greeting = 'Hello';

// const greeter = {
//   message: (function() {
//     let name = 'Naveed';
//     let greeting = 'Hello';
//     return `${greeting} ${name}!`;
//   })(),
//   sayGreetings() {
//     console.log(this.message);
//   }
// };

const greeter = (function(name, greeting) {
  return {
    message: `${greeting} ${name}!`,
    sayGreetings() {
      console.log(this.message);
    }
  };
})('Naveed', 'Hello');

greeter.sayGreetings();
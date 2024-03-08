// class Cat {
//   constructor(name = 'Kitty') {
//     this.name = name;
//   }

//   greet() {
//     console.log(`My name is ${this.name} and i'm a cat!`);
//   }

//   rename(newName) {
//     this.name = newName;
//   }

//   static genericGreeting() {
//     console.log("Hello! I'm a cat!")
//   }
// }

// let pip = new Cat('pip');
// pip.greet()
// Cat.genericGreeting();

// class Rectangle {
//   constructor(width, length) {
//     this.width = width;
//     this.length = length;
//   }

//   getWidth() {
//     return this.width;
//   }

//   getLength() {
//     return this.length;
//   }

//   getArea() {
//     return this.width * this.length;
//   }
// }

// class Square extends Rectangle {
//   constructor(width) {
//     super(width, width);
//   }
// }

// let rect = new Rectangle(4, 5);

// console.log(rect.getWidth()); // 4
// console.log(rect.getLength()); // 5
// console.log(rect.getArea()); // 20

// let square = new Square(5);
// console.log(`area of square = ${square.getArea()}`); // area of square = 25

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//   speaks() {
//     return `${this.name} says meowwww.`;
//   }
// }

// let fakeCat = Object.create(Cat.prototype)
// console.log(fakeCat instanceof Cat); // logs true
// console.log(fakeCat.name);           // logs undefined
// console.log(fakeCat.speaks());       // logs undefined says meowwww.

// class Pet {
//   constructor(name, age) {
//     this.name = name;
//     this.age = age;
//   }
// }

// class Cat extends Pet {
//   constructor(name, age, color) {
//     super(name, age);
//     this.color = color;
//   }

//   info() {
//     return `My cat ${this.name} is ${this.age} years old and has ${this.colors} fur.`
//   }
// }

// let pudding = new Cat('Pudding', 7, 'black and white');
// let butterscotch = new Cat('Butterscotch', 10, 'tan and white');

// console.log(pudding.info());
// console.log(butterscotch.info());

class Pet {
  constructor(type, name) {
    this.type = type;
    this.name = name;
  }
}

class Owner {
  constructor(name) {
    this.name = name;
    this.pets = [];
  }

  numberOfPets() {
    return this.pets.length;
  }

  addPet(pet) {
    this.pets.push(pet);
  }
}

class Shelter {
  constructor() {
    this.owners = [];
  }

  addOwner(owner) {
    this.owners.push(owner);
  }

  adopt(owner, pet) {
    owner.addPet(pet);
    if (!this.owners.includes(owner)) {
      this.owners.push(owner);
    }
  }

  printAdoptions() {
    this.owners.forEach(owner => {
      console.log(`${owner.name} has adopted the following pets:`);
      owner.pets.forEach(pet => {
        console.log(`A ${pet.type} named ${pet.name}`)
      })
      console.log('')
    })
  }
}

let butterscotch = new Pet('cat', 'Butterscotch');
let pudding      = new Pet('cat', 'Pudding');
let darwin       = new Pet('bearded dragon', 'Darwin');
let kennedy      = new Pet('dog', 'Kennedy');
let sweetie      = new Pet('parakeet', 'Sweetie Pie');
let molly        = new Pet('dog', 'Molly');
let chester      = new Pet('fish', 'Chester');

let phanson = new Owner('P Hanson');
let bholmes = new Owner('B Holmes');

let shelter = new Shelter();
shelter.adopt(phanson, butterscotch);
shelter.adopt(phanson, pudding);
shelter.adopt(phanson, darwin);
shelter.adopt(bholmes, kennedy);
shelter.adopt(bholmes, sweetie);
shelter.adopt(bholmes, molly);
shelter.adopt(bholmes, chester);
shelter.printAdoptions();
console.log(`${phanson.name} has ${phanson.numberOfPets()} adopted pets.`);
console.log(`${bholmes.name} has ${bholmes.numberOfPets()} adopted pets.`);
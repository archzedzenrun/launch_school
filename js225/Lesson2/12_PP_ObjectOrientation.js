// PP 1 Object factory!

function createProduct(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,
    setPrice(newPrice) {
      if (value >= 0) {
        this.price = newPrice;
      } else {
        console.log('Invalid Price!');
      }
    },
    describeProduct() {
      console.log(`Name: ${this.name}`);
      console.log(`ID: ${this.id}`);
      console.log(`Price: ${this.price}`);
      console.log(`Stock: ${this.stock}`);
    }
  }
}

// function setPrice(product, value) {
//   if (value < 0) {
//     console.log('Invalid price');
//     return;
//   }

//   product.price = value;
// }

// function describeProduct(product) {
//   console.log(`Name: ${product.name}`);
//   console.log(`ID: ${product.id}`);
//   console.log(`Price: ${product.price}`);
//   console.log(`Stock: ${product.stock}`);
// }

let scissors = createProduct(0, 'Scissors', 8, 10);
let drill = createProduct(1, 'Cordless Drill', 15, 45);
let hammer = createProduct(2, 'Claw Hammer', 5, 20);

drill.describeProduct();
hammer.describeProduct();
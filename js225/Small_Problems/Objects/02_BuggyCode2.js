const item = {
  name: 'Foo',
  description: 'Fusce consequat dui est, semper.',
  price: 50,
  quantity: 100,
  discount(percent) {
    const discount = this.price * percent / 100;
    // this.price -= discount;

    return this.price - discount;
  },
};

console.log(item.discount(20))   // should return 40
//= 40
console.log(item.discount(50))   // should return 25
//= 20
console.log(item.discount(25))   // should return 37.5
//= 15

// The problem here is that on every invocation of the discount method we are mutating the object by reassigning the price property to the value of price - discount.
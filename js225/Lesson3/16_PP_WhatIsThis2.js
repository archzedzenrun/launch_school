// PP 1
// 'this' references teh myChildObject object and count is undefined.

// PP 2
// myObject.myChildObject.myMethod.call(myObject);

// PP 3
// "Peter Parker is the Amazing Spiderman!"
// bind binded 'this' to the person object

// PP 4
// 35000

let computer = {
  price: 30000,
  shipping: 2000,
  total() {
    let tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount.call(this);
  }
};

console.log(computer.total());

// We call the sepcialDiscount function with the context of the computer object to get the discounted price.
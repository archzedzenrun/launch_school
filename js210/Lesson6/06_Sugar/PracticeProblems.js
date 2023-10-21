// Problem 1 ------------------------------------------------------------------
function foo(bar, qux, baz) {
  return {
    bar: bar,
    qux: qux,
    baz: baz,
  };
}

// Problem 2 ------------------------------------------------------------------
function foo() {
  return {
    bar: function() {
      console.log("bar");
    },
    qux: function(arg1) {
      console.log("qux");
      console.log(arg1);
    },
    baz: function(arg1, arg2) {
      console.log("baz");
      console.log(arg1);
      console.log(arg2);
    },
  };
}

// Problem 3 ------------------------------------------------------------------
function foo(one, two, three) {
  return {
    bar: one,
    baz: two,
    qux: three,
  };
}

// let obj = foo(1, 2, 3);
// let baz = obj.baz;
// let qux = obj.qux;
// let bar = obj.bar;

// Problem 4 ------------------------------------------------------------------
function foo(arr) {
  return [arr[2], 5, arr[0]];
}

// let array = [1, 2, 3];
// let result = foo(array);
// let bar = result[0];
// let qux = result[1];
// let baz = result[2];

// Problem 5 ------------------------------------------------------------------
function product(num1, num2, num3) {
  return num1 * num2 * num3;
}

// let array = [2, 3, 5];
// let result = product(array[0], array[1], array[2]);

// Problem 6 ------------------------------------------------------------------
function product() {
  return Object.values(arguments).reduce((total, number) => total * number);
}

// let result = product(2, 3, 4, 5);
// console.log(result);

// Problem 7 ------------------------------------------------------------------
// const { fo, ...rest } = { foo: 42, bar: 3.1415, qux: "abc" };
// console.log(fo);         // 42
// console.log(rest);        // { bar: 3.1415, qux: 'abc' }

// Problem 8 ------------------------------------------------------------------
const obj = {
  first: "I am the first",
  second: "I am the second",
  third: [1, 2, 3],
  rest: { a: 'a', b: 'b' },
};

// const { first, second, ...rest } = obj;
// const first = obj.first;
// const second = obj.second;
// const rest = { third: obj.third, rest: obj.rest };
// console.log(first, second, rest)

// Problem 9 ------------------------------------------------------------------
function qux() {
  let animalType = "cat";
  let age = 9;
  let colors = ["black", "white"];
  return {
    type: animalType,
    age,
    colors,
  };
}

// let { type, age, colors } = qux();
// console.log(type);    // cat
// console.log(age);     // 9
// console.log(colors);  // [ 'black', 'white' ]

// Problem 10 -----------------------------------------------------------------
function strObj(first, second, third, fourth, last) {

  return {
    first,
    last,
    middle: [second, third, fourth].sort()
  };
}

let strings = ['hi', 'hey', 'hello', 'world', 'bye'];
let { first, last, middle } = strObj(...strings);
console.log(first, last, middle);

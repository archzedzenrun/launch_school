// PP 1
// bind method

// PP 2
// nothing is output because the foo function isnt invoked

// PP 3
// 5

// PP 4
// JavaScript makes sense!
// The foo function is bound to the context of the object referenced by positiveMentality, which is then set as a (logMessage) property value in negativeMentality. When logMessage is invoked, the output is the context which the function was bound to.

// PP 5
let obj = {
  a: 'Amazebulous!',
};
let otherObj = {
  a: "That's not a real word!",
};

function foo() {
  console.log(this.a);
}

let bar = foo.bind(obj); // foo function is bound to the context of obj

bar.call(otherObj); // we are trying to invoke the function in the context of otherObj, but a binding cant be changed once its made. Therefore the output will be: 'Amazebulous!'
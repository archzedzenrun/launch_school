function newStack() {
  let stack = [];
  return {
    push(value) {
      stack.push(value);
    },

    pop() {
      return stack.pop();
    },

    printStack() {
      stack.forEach(element => console.log(element));
    }
  };
}
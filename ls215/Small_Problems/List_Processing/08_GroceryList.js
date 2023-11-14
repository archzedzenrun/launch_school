function buyFruit(fruits) {
  let list = [];
  fruits.forEach(fruit => {
    for (let counter = 0; counter < fruit[1]; counter += 1) {
      list.push(fruit[0]);
    }
  });

  return list;
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
function union(arr1, arr2) {
  let unitedArray = [];
  addNonDups(unitedArray, arr1);
  addNonDups(unitedArray, arr2);
  return unitedArray;
}

function addNonDups(resultArray, array) {
  array.forEach(num => {
    if (!resultArray.includes(num)) {
      resultArray.push(num);
    }
  })
}

console.log(union([1, 3, 5], [3, 6, 9]));    // [1, 3, 5, 6, 9]
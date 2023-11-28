const vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'suv', 'motorcycle', 'car', 'truck'];

function countOccurrences() {
  let counts = vehicles.reduce((countObj, vehicle) => {
    if (countObj[vehicle]) {
      countObj[vehicle] += 1;
    } else {
      countObj[vehicle] = 1;
    }

    return countObj;
  }, {})

  Object.entries(counts).forEach(vehicle => {
    console.log(`${vehicle[0]} => ${vehicle[1]}`);
  });
}

countOccurrences(vehicles);

// console output
// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
// suv => 1
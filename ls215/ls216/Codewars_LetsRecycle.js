/*
https://www.codewars.com/kata/5b6db1acb118141f6b000060
TIME TAKEN: 25:00

Task
You will be given a list of objects. Each object has type, material, and
possibly secondMaterial. The existing materials are: paper, glass, organic,
and plastic.

Your job is to sort these objects across the 4 recycling bins according to
their material (and secondMaterial if it's present), by listing the types
of objects that should go into those bins.

Notes
The bins should come in the same order as the materials listed above
All bins should be listed in the output, even if some of them are empty
If an object is made of two materials, its type should be listed in
both of the respective bins
The order of the type's in each bin should be the same as the order of
their respective objects was in the input list

Input: Array of objects
Output: Array of arrays

Rules:
-Sort the object types (names) into bins (arrays)
-Bins are ordered paper, glass, organic, plastic
-Put each type into the bin they belong based on material and secondMaterial
-Empty arrays should be included for empty bins
-Order of types in bins should be ordered based on input object order


Questions:
-Less/more than 1 arg? -> No
-Arg will always be array? -> Yes
-Can array be empty? -> Yes
-Will object type and material always be strings? -> Yes
-Will the array only contain objects? -> Yes
-Can the array be any size? -> Yes

Data Structure:
Object to hold materials
Arrays

Algorithm:
-Create a materials var to an empty object
{ paper: [], glass: [], organic: [], plastic: [] }

-Iterate through the input array
-Check if 'material' key exists in current object
  -If it does, push current object type to the current material key in the materials object
-Repeat last step for 'secondMaterial'

-Return the values of the materials object
*/

function recycle(object) {
  let materials = { paper: [], glass: [], organic: [], plastic: [] };
  object.forEach(item => {
    if (item.material) materials[item.material].push(item.type);
    if (item.secondMaterial) materials[item.secondMaterial].push(item.type);
  })

  return Object.values(materials);
}

console.log(recycle([{"type": "rotten apples", "material": "organic"}])) // [[], [], ['rotten apples'], []]

console.log(recycle([])) // [[], [], [], []]

console.log(recycle([{"type": "out of date yogurt", "material": "organic", "secondMaterial": "plastic"}])) // [[], [], ['out of date yogurt'], ['out of date yogurt']]

console.log(recycle([
  {"type": "rotten apples", "material": "organic"},
  {"type": "out of date yogurt", "material": "organic", "secondMaterial": "plastic"},
  {"type": "wine bottle", "material": "glass", "secondMaterial": "paper"},
  {"type": "amazon box", "material": "paper"},
  {"type": "beer bottle", "material": "glass", "secondMaterial": "paper"}
])) // output = [
//   ["wine bottle", "amazon box", "beer bottle"],
//   ["wine bottle", "beer bottle"],
//   ["rotten apples", "out of date yogurt"],
//   ["out of date yogurt"]
// ]

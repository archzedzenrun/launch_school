/*
https://edabit.com/challenge/9ZZ2zGwgPfbAxQa86
TIME TAKEN: 25:00

You were tasked with making a list of every makeup item your local pharmacy had in stock. You created a very long array of each item, with each element having both a name and brand property. Now you're looking to simplify the list by combining duplicate items, and adding a count property to everything.

Input: Array of objects
Output: Array of objects

Rules:
-Combine same brand/name items into one item with a count of how many there are

Questions:
-Less/more than 1 arg? -> No
-Will the arg always be array? -> Yes
-Will the array every be empty? -> No
-Will the elements in the array always be objects? -> Yes
-Will all objects have a brand and name property? -> Yes
-Will these property values be strings? -> Yes
-Should the output be in a specific order? -> Order they appear in input
-Can the object be any size? -> Yes
-Brands can be the same with different named items? -> Yes

Data Structure/Algorithm:
-Create a results variable to empty array
-Iterate through the input array
  -Check if any objects in the results array have a brand and name equal to the current object
  -If it does increment the count value of that object in results by 1
  -Otherwise move current object to results with a count value of 1
-Return results array
*/

function duplicateItem(item, allItems) {
  for (let i = 0; i < allItems.length; i += 1) {
    if (allItems[i].brand === item.brand && allItems[i].name === item.name) {
      return allItems[i];
    }
  }
}

function simplifyList(list) {
  let results = [];
  list.forEach(item => {
    let existingItem = duplicateItem(item, results);
    if (existingItem) {
      existingItem.count += 1;
    } else {
      item['count'] = 1;
      results.push(item);
    }
  })

  return results;
}


console.log(simplifyList([{ brand: "NARS", name: "Cosmetics Voyageur Pallete" }])) // [{ brand: "NARS", name: "Cosmetics Voyageur Pallete" count: 1 }]

console.log(simplifyList([{ brand: "NARS", name: "Cosmetics Voyageur Pallete" }, { brand: "NARS", name: "Liquid Lipstick" }])) // [{ brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 1 }, { brand: "NARS", name: "Liquid Lipstick", count: 1 }]

console.log(simplifyList([
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "NARS", name: "Cosmetics Voyageur Pallete" },
  { brand: "Urban Decay", name: "Naked Honey Pallete" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" },
  { brand: "Stila", name: "Stay All Day Liquid Lipstick" }
])) //➞ [
//   { brand: "NARS", name: "Cosmetics Voyageur Pallete", count: 2 },
//   { brand: "Urban Decay", name: "Naked Honey Pallete", count: 1 },
//   { brand: "Stila", name: "Stay All Day Liquid Lipstick", count: 3 }
// ]

const tests = [
  [
    [
      { brand: 'NARS', name: 'Cosmetics Voyageur Pallete' },
      { brand: 'NARS', name: 'Cosmetics Voyageur Pallete' },
      { brand: 'Urban Decay', name: 'Naked Honey Pallete' },
      { brand: 'Stila', name: 'Stay All Day Liquid Lipstick' },
      { brand: 'Stila', name: 'Stay All Day Liquid Lipstick' },
      { brand: 'Stila', name: 'Stay All Day Liquid Lipstick' },
    ],
    [
      { brand: 'NARS', name: 'Cosmetics Voyageur Pallete', count: 2 },
      { brand: 'Urban Decay', name: 'Naked Honey Pallete', count: 1 },
      { brand: 'Stila', name: 'Stay All Day Liquid Lipstick', count: 3 },
    ],
  ],
  [
    [{ brand: 'NYX', name: 'Soft Matte Lip Cream' }],
    [{ brand: 'NYX', name: 'Soft Matte Lip Cream', count: 1 }],
  ],
  [
    [
      { brand: 'e.l.f', name: 'Flawless Finish Foundation' },
      { brand: 'e.l.f', name: 'Flawless Finish Foundation' },
      { brand: 'e.l.f', name: 'Flawless Finish Foundation' },
      { brand: 'e.l.f', name: 'Flawless Finish Foundation' },
      { brand: 'Giorgio Armani', name: 'Luminous Silk Foundation' },
      { brand: 'Giorgio Armani', name: 'Luminous Silk Foundation' },
      { brand: 'Marc Jacobs', name: 'Beauty O!' },
      { brand: 'Hourglass', name: 'Ambient Lighting Bronzer' },
      { brand: 'Hourglass', name: 'Ambient Lighting Bronzer' },
      { brand: 'Hourglass', name: 'Ambient Lighting Bronzer' },
      { brand: 'EltaMD', name: 'Foaming Facial Cleanser' },
    ],
    [
      { brand: 'e.l.f', name: 'Flawless Finish Foundation', count: 4 },
      { brand: 'Giorgio Armani', name: 'Luminous Silk Foundation', count: 2 },
      { brand: 'Marc Jacobs', name: 'Beauty O!', count: 1 },
      { brand: 'Hourglass', name: 'Ambient Lighting Bronzer', count: 3 },
      { brand: 'EltaMD', name: 'Foaming Facial Cleanser', count: 1 },
    ],
  ],
];

tests.forEach(item => {
  console.log(simplifyList(item[0]))
})

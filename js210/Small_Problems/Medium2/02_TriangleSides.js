/*
Algorithm:
-Helper function for valid triangle
-Find the 2 smallest side values
-Add them together and check if they are larger than the largest value
-Return true if they are

Main function:
-Check if all three sides are equal
  -If they are return 'equilateral'
-Else check if only two sides are equal'
  -If so, return 'isosceles'
-Return 'scalene' if all sides are different lengths
*/

function validTriangle(sides) {
  sides = sides.sort((a, b) => a - b);
  return sides[0] > 0 && sides[0] + sides[1] > sides[2];
}

function triangle(...sides) {
  if (!validTriangle(sides)) {
    return "invalid";
  }

  let uniqueSides = [...new Set(sides)];
  if (uniqueSides.length === 1) {
    return 'equilateral';
  } else if (uniqueSides.length === 2) {
    return 'isosceles';
  } else if (uniqueSides.length === 3) {
    return 'scalene';
  }
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
console.log(triangle(3, 1.5, 1.5)); // invalid because shortest two values are not greater than longest.
console.log(triangle(3, 4, 4)); // isosceles, two longer values are equal.
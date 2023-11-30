function validTriangle(angles) {
  let allGreaterThanZero = angles.every(angle => angle > 0);
  let sumEquals180 = angles.reduce((sum, angle) => sum + angle) === 180;
  return allGreaterThanZero && sumEquals180;
}

function rightTriangle(angles) {
  return angles.some(angle => angle === 90);
}

function acuteTriangle(angles) {
  return angles.every(angle => angle < 90);
}

function obtuseTriangle(angles) {
  return angles.filter(angle => angle > 90).length === 1;
}

function classifyTriangle(angles) {
  if (rightTriangle(angles)) {
    return 'right';
  } else if (acuteTriangle(angles)) {
    return 'acute';
  } else if (obtuseTriangle(angles)) {
    return 'obtuse';
  }
}

function triangle(...angles) {
  if (!validTriangle(angles)) {
    return 'invalid';
  } else {
    return classifyTriangle(angles);
  }
}

console.log(triangle(60, 70, 50));       // "acute"
console.log(triangle(30, 90, 60));       // "right"
console.log(triangle(120, 50, 10));      // "obtuse"
console.log(triangle(0, 90, 90));        // "invalid"
console.log(triangle(50, 50, 50));       // "invalid"
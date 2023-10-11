function average(num1, num2, num3) {
  return (num1 + num2 + num3) / 3;
}

function getGrade(grade1, grade2, grade3) {
  let gradeAverage = average(grade1, grade2, grade3);
  if (gradeAverage > 0 && gradeAverage < 60) {
    return 'F';
  } else if (gradeAverage < 70) {
    return 'D';
  } else if (gradeAverage < 80) {
    return 'C';
  } else if (gradeAverage < 90) {
    return 'B';
  } else if (gradeAverage <= 100) {
    return 'A';
  }
}

console.log(getGrade(95, 90, 93));    // "A"
console.log(getGrade(50, 50, 95));    // "D"
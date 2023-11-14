/*
Input: Object containing nested objects
Output: Object

student is a property of studentScores.
each student has properties:
  id - integer
  scores - object containing 2 properties:
           exams - array of integers
           exercises - array of integers

current iteration:
student1.scores.exams
student1.scores.exercises

Algorithm:
-Iterate through the input object
-On each iteration:
  -Acess the scores property of the current student
    -Access the exams property of scores object
      -Find the average of the exams array
        -Multiply the average by .65

    -Access the exercises property of scores object
      -Find the average of the exercises array
        -Multiply the average by .35

    -Add the weighted scores together
    -Round to nearest integer to get final grade
    -Get letter grade based on final grade
    -Combine final grade with letter grade "81 (C)"

*/

let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function getLetterGrade(grade) {
  if (grade < 60) {
    return 'F';
  } else if (grade < 69) {
    return 'E';
  } else if (grade < 77) {
    return 'D';
  } else if (grade < 85) {
    return 'C';
  } else if (grade < 93) {
    return 'B';
  } else if (grade < 101) {
    return 'A';
  }
}

function generateExamAverage(studentScores) {
  return {
    average: examAverage,
    minimum: minScore(studentScores.exams),
    maximum: maxScore(studentScores.exams),
  };
}

function generateClassRecordSummary(scores) {
  let summary = { studentGrades: [], exams: [] };

  for (let student in scores) {
    let studentScores = scores[student].scores;
    let examAverage = calculateAverage(studentScores.exams);
    let exerciseAverage = calculateAverage(studentScores.exercises);
    let grade = Math.round(((examAverage * .65) + (exerciseAverage * .35)));
    summary.studentGrades.push(`${grade} (${getLetterGrade(grade)})`);
    summary.exams.push({
      average: examAverage,
      minimum: minScore(studentScores.exams),
      maximum: maxScore(studentScores.exams),
    });
  }

  return summary;
}

function minScore(scores) {
  return Math.min(...scores);
}

function maxScore(scores) {
  return Math.max(...scores);
}

function calculateAverage(scores) {
  return scores.reduce((sum, score) => sum + score) / scores.length;
}

console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }
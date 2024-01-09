function createStudent(name, year) {
  return {
    name,
    year,
    courses: [],
    info() {
      console.log(`${this.name} is a ${this.year} year student`);
    },
    listCourses() {
      return this.courses;
    },
    addCourse(course) {
      this.courses.push(course);
    },
    addNote(code, note) {
      this.courses.forEach(course => {
        if (course.code === code) {
          if (course.note) {
            course.note += ('; ' + note);
          } else {
            course.note = `${course.name}: ` + note;
          }
        }
      })
    },
    viewNotes() {
      this.courses.forEach(course => {
        if (course.note) {
          console.log(course.note);
        }
      })
    },
    updateNote(code, note) {
      this.courses.forEach(course => {
        if (course.code === code) {
          course.note = `${course.name}: ` + note;
        }
      })
    }
  };
}

let school = {
  students: [],
  addStudent(name, year) {
    const VALID_YEARS = ['1st', '2nd', '3rd', '4th', '5th'];
    let student = createStudent(name, year);
    if (VALID_YEARS.includes(student.year)) {
      this.students.push(student);
      return student;
    } else {
      console.log("Invalid Year");
    }
  },
  enrollStudent(student, courseName, courseCode) {
    student.addCourse({
      name: courseName,
      code: courseCode,
    });
  },
  addGrade(student, courseName, grade) {
    student.listCourses().forEach(course => {
      if (course.name === courseName) {
        course.grade = grade;
      }
    })
  },
  getReportCard(student) {
    student.listCourses().forEach(course => {
      let grade = course.grade ? course.grade : 'In progress';
      console.log(`${course.name}: ${grade}`)
    })
  },
  courseReport(courseName) {
    let courseStudents = this.students.filter(student => {
      return student.listCourses().some(course => course.name === courseName && course.grade);
    })

    if (courseStudents.length < 1) {
      console.log(undefined);
      return;
    }

    let grades = [];
    console.log(`=${courseName} Grades=`)
    courseStudents.forEach(student => {
      student.listCourses().forEach(course => {
        if (course.name === courseName && course.grade) {
          grades.push(course.grade);
          console.log(`${student.name}: ${course.grade}`);
        }
      })
    })
    console.log('---');
    let average = grades.reduce((total, grade) => total + grade) / grades.length;
    console.log(`Course Average: ${average}`);
  }
}

// console.log(school.addStudent('cruz', '5th'));
// console.log(school);

let foo = school.addStudent('foo', '3rd');
school.enrollStudent(foo, 'Math', 101);
school.enrollStudent(foo, 'Advanced Math', 102);
school.addGrade(foo, 'Math', 95);
// school.getReportCard(foo);


let bar = school.addStudent('bar', '4th');
school.enrollStudent(bar, 'Math', 101);
school.addGrade(bar, 'Math', 75);
school.courseReport('Math');
school.courseReport('Physics');
// {
//   name: 'bar',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// }
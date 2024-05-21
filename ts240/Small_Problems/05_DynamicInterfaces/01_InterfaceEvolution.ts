interface Person {
  name: string,
  age: number,
}

interface Employee extends Person {
  employeeId: number,
}

const employee:Employee = {
  name: 'cruz',
  age: 36,
  employeeId: 5
}

console.log(employee);
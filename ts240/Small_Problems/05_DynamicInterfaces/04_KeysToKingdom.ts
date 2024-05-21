interface UserData {
  name: string;
  age: number;
  email: string;
}

/*
type UserKeys = keyof UserData
*/

function printUserDataField(obj: UserData, key: keyof UserData): void { // could also use UserKeys type instead
  console.log(obj[key])
}

const userData: UserData = {
  name: "Alice",
  age: 25,
  email: "alice@example.com",
};

printUserDataField(userData, "name");
printUserDataField(userData, "age");
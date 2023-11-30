/*
Rules:
Featured Number:
-Must be odd
-Multiple of 7
-Must have unique digits

Increment the input number until these conditions are met
*/

function uniqueNum(num) {
  let digits = [...String(num)];
  let uniqueDigits = [...new Set(digits)]
  return digits.length === uniqueDigits.length;
}

function featured(num) {
  for (let n = num; num < 9876543201; n += 1) {
    if (n % 7 === 0 && uniqueNum(n)) {
      return n;
    }
  }

  return "There is no possible number that fulfills those requirements.";
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."
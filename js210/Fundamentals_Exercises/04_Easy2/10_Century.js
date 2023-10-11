function yearSuffix(num) {
  if ([11, 12, 13].includes(num % 100)) return 'th';
  let stringNum = String(num);
  let lastDigit = stringNum[stringNum.length - 1];
  switch (lastDigit) {
    case '1': return 'st';
    case '2': return 'nd';
    case '3': return 'rd';
    default: return 'th';
  }
}

function century(year) {
  let centuryNum = Math.floor(year / 100) + 1;
  if (year % 100 === 0) centuryNum -= 1;
  return String(centuryNum) + yearSuffix(centuryNum);
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"
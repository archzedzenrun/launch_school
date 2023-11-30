/*
Rules:
-Find how many chars in the string are lowercase letters, uppercase letters, or neither (percents)
-String wont be empty

-Calc percentage by dividing amount by total amount and multiplying by 100

Data Structure:
Object to hold result

Algorithm:
-Find how many chars are lowercase/uppercase/neither in the input string
-Divide each of these values by the total length of the string and multiply by 100
-Return the results in an object.
*/

function calculatePercentage(count, totalCount) {
  return ((count / totalCount) * 100).toFixed(2);
}

function letterPercentages(string) {
  let totalCount = string.length;
  let lowerCaseCount = (string.match(/[a-z]/g) || []).length;
  let upperCaseCount = (string.match(/[A-Z]/g) || []).length;
  let neitherCount = totalCount - (lowerCaseCount + upperCaseCount)

  return { lowercase: calculatePercentage(lowerCaseCount, totalCount),
           uppercase: calculatePercentage(upperCaseCount, totalCount),
           neither: calculatePercentage(neitherCount, totalCount),
         }
}

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
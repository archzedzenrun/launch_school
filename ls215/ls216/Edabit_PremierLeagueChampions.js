/*
https://edabit.com/challenge/xuFor4LkEXfBmtDqH
TIME TAKEN: 30:00

Create a function that takes an array of football clubs with properties: name, wins, loss, draws, scored, conceded, and returns the team name with the highest number of points. If two teams have the same number of points, return the team with the largest goal difference.
How to Calculate Points and Goal Difference

team = { name: "Manchester United", wins: 30, loss: 3, draws: 5, scored: 88, conceded: 20 }

Total Points = 3 * wins + 0 * loss + 1 * draws = 3 * 30 + 0 * 3 + 5 * 1 = 95 points
Goal Difference = scored - conceded = 88 - 20 = 68

Input: Array of objects
Output: String (winning team)

Rules:
-Find the team name with the highest number of points
-Points are determined by: Wins * 3 + draws
-If two teams have the same points:
-Return the one with the largest goal difference which is determined by:
scored - conceded

Questions:
-Less/more than 1 arg? -> No
-Arg always array? -> Yes
-Will there ever be less/more/different than the presented keys? -> No
-Will values always be string for name and positive integers for others? -> Yes
-Can the array be empty? -> Yes -> Return empty string
-What if two teams have the same largest goal difference? -> They wont
-Can the array be any size? -> Yes

Example:
3 * wins - 30 * 3 = 90
0 * loss - 0 * 3 = 0
1 * draw - 5 * 1 = 5
Total: 95

Data Structure:

Algorithm:
-Iterate through the input array
  -Multiply wins by 3 and add to draws to get total points
  -Add total property to each object with total points
  -Add goalDifference property to each object (scored - conceded)
-Find the largest total value in the array of objects
-Filter out teams whos total is not equal to largest total
-Sort the object by goalDifference in descending order
-Return the first team name in the sorted object
*/

function champions(teams) {
  teams.forEach(team => {
    team['total'] = (team.wins * 3) + team.draws;
    team['goalDiff'] = team.scored - team.conceded;
  })

  let largestTotal = Math.max(...teams.map(team => team.total));
  teams = teams.filter(team => team.total === largestTotal);
  return teams.sort((team1, team2) => team2.goalDiff - team1.goalDiff)[0].name;
}

// console.log(champions([{}])) // ''
console.log(champions([{
    name: "Arsenal",
    wins: 24,
    loss: 6,
    draws: 8,
    scored: 98,
    conceded: 29,
  },])) // "Arsenal"

console.log(champions([
  {
    name: "Manchester United",
    wins: 30,
    loss: 3,
    draws: 5,
    scored: 88,
    conceded: 20,
  },
  {
    name: "Arsenal",
    wins: 30,
    loss: 6,
    draws: 5,
    scored: 98,
    conceded: 29,
  },
  {
    name: "Chelsea",
    wins: 22,
    loss: 8,
    draws: 8,
    scored: 98,
    conceded: 29,
  }])); // "Arsenal"

console.log(champions([
  {
    name: "Manchester United",
    wins: 30,
    loss: 3,
    draws: 5,
    scored: 88,
    conceded: 20,
  },
  {
    name: "Arsenal",
    wins: 24,
    loss: 6,
    draws: 8,
    scored: 98,
    conceded: 29,
  },
  {
    name: "Chelsea",
    wins: 22,
    loss: 8,
    draws: 8,
    scored: 98,
    conceded: 29,
  },
  ]))
//➞ "Manchester United"

console.log(
  champions([
    {
      name: "Manchester United",
      wins: 30,
      loss: 3,
      draws: 5,
      scored: 88,
      conceded: 20,
    },
    {
      name: "Arsenal",
      wins: 24,
      loss: 6,
      draws: 8,
      scored: 98,
      conceded: 29,
    },
    {
      name: "Chelsea",
      wins: 22,
      loss: 8,
      draws: 8,
      scored: 98,
      conceded: 29,
    },
  ])); //"Manchester United"

console.log(
  champions([
    {
      name: "Manchester City",
      wins: 30,
      loss: 8,
      draws: 0,
      scored: 67,
      conceded: 20,
    },
    {
      name: "Liverpool",
      wins: 34,
      loss: 2,
      draws: 2,
      scored: 118,
      conceded: 29,
    },
    {
      name: "Leicester City",
      wins: 22,
      loss: 8,
      draws: 8,
      scored: 98,
      conceded: 29,
    },
  ])); //"Liverpool"

console.log(
  champions([
    {
      name: "Manchester City",
      wins: 30,
      loss: 8,
      draws: 0,
      scored: 67,
      conceded: 20,
    },
    {
      name: "NewCastle United",
      wins: 34,
      loss: 2,
      draws: 2,
      scored: 118,
      conceded: 36,
    },
    {
      name: "Leicester City",
      wins: 34,
      loss: 2,
      draws: 2,
      scored: 108,
      conceded: 21,
    },
  ])); //"Leicester City"

console.log(
  champions([
    {
      name: "Manchester City",
      wins: 30,
      loss: 6,
      draws: 2,
      scored: 102,
      conceded: 20,
    },
    {
      name: "Liverpool",
      wins: 24,
      loss: 6,
      draws: 8,
      scored: 118,
      conceded: 29,
    },
    {
      name: "Arsenal",
      wins: 28,
      loss: 2,
      draws: 8,
      scored: 87,
      conceded: 39,
    },
  ])); //"Manchester City"

console.log(
  champions([
    {
      name: "Manchester City",
      wins: 30,
      loss: 6,
      draws: 2,
      scored: 102,
      conceded: 20,
    },
    {
      name: "Liverpool",
      wins: 24,
      loss: 6,
      draws: 8,
      scored: 118,
      conceded: 29,
    },
    {
      name: "Arsenal",
      wins: 30,
      loss: 0,
      draws: 8,
      scored: 87,
      conceded: 39,
    },
  ])); //"Arsenal"

console.log(
  champions([
    {
      name: "Chelsea",
      wins: 35,
      loss: 3,
      draws: 0,
      scored: 102,
      conceded: 20,
    },
    {
      name: "Liverpool",
      wins: 24,
      loss: 6,
      draws: 8,
      scored: 118,
      conceded: 29,
    },
    {
      name: "Arsenal",
      wins: 28,
      loss: 2,
      draws: 8,
      scored: 87,
      conceded: 39,
    },
  ])); //"Chelsea"
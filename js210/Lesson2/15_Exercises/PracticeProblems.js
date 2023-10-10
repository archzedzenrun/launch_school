// Problem 1 ------------------------------------------------------------------

// Line 9 will log ['red', 'green', 'blue', 'yellow]. colors is passed to the updateColors function as an argument which invokes the mutating push method on the array and passes the color variable declared on line 1 as an argument.

// Problem 2 ------------------------------------------------------------------

// Line 9 will log ['red', 'green', 'blue', undefined]. The function on line 4 takes 2 parameters (colors, color) but on line 8 we are only passing 1 argument (the colors array) which leaves the color parameter undefined. The argument being passed to push on line 5 is the locally scoped color variable which has a value of undefined.

// Problem 3 ------------------------------------------------------------------

// On line 9 we pass colors and color1 variables as arguments to the updateColors function which mutates the colors array to ['red', 'green', 'blue', 'purple'].

// On line 10 the same thing happens, only this time we are passing color2 as the second argument. The colors array is now ['red', 'green', 'blue', 'purple', pink'] which is what is logged on line 11.

// Problem 4 ------------------------------------------------------------------

// On line 10 a newColors variable is declared and assigned to the return value of passing colors and color1 as arguments to the updateColors function. The function mutates the colors argument on line 6 and returns the same array object which now has a value of ['red', 'green', 'blue', 'purple']. This means that colors and newColors are still both pointing to the same array object. On line 11 updateColors is invoked again and passed newColors and color2 as arguments which again mutates the reference argument colors. The value of the array that colors and newColors points to now has a value of ['red', 'green', 'blue', 'purple', 'pink'] which is what is logged on line 12.

// Problem 5 ------------------------------------------------------------------

// On line 14 variable newColors is declared and assigned to the return value of passing colors to the removeColor function. The removeColor function removes the last element of the argument by using the mutating pop method and reassigns the color variable declared on line 1 to that value ('blue'). The function returns the new value of the array which is ['red', 'green']. colors and newColors both point to that same array object.

// On line 15 colors and color are passed to the addColor function which mutates the colors argument with the push method by appending the second argument to the end of the colors array. colors and newColors are still pointing to the same array object which now has a value of ['red', 'green', 'blue'] which is what is logged on line 16.

// Problem 6 ------------------------------------------------------------------

// On line 9 variable word is declared and assigned to the string 'hello'.

// On line 10 capitalizedWord variable is declared and assigned to the return value of passing word to the capitalize function. The capitalize function returns a new string with the value of 'Hello'.

// On line 11 variable exclaimedWord is declared and assigned to the return value of passing capitalizedWord to the exclaim function. The exclaim function reassigns global variable word to 'hello!!!' and also returns this value.

// Line 13 logs 'hello!!!'
// Line 14 logs 'Hello'
// Line 15 logs 'hello!!!'

// Problem 7 ------------------------------------------------------------------

// On line 9 variable word is declared and assigned to the string 'hello'.

// On line 10 variable capitalizedWord is declared and assigned to the return value of passing word to the capitalize function. The capitalize function returns a new string with a value of 'Hello'

// On line 11 variable exclaimedWord is declared and assigned to the return value of passing capitalizedWord as an argument to the exclaim function. The exclaim function reassigns and returns the value of the locally scoped word variable to 'Hello!!!'.

// Line 13 logs 'hello'
// Line 14 logs 'Hello'
// Line 15 logs 'Hello!!!'
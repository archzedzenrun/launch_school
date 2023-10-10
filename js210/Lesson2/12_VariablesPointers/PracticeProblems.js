// Problem 1 ------------------------------------------------------------------

// Line 4 will log 'Hello' which is the value that the myWord variable points to.

// Line 5 will log 'Hello'. Even though myOtherWord points to myWord, it is not the same string object, it is a different string object with the same value.

// Problem 2 ------------------------------------------------------------------

// Line 5 will log 'Goodbye'. myWord was reassigned on line 3.

// Line 6 will output 'Hello'. myOtherWord still points to a string object with a value of 'Hello'.

// Problem 3 ------------------------------------------------------------------

// This code will log ['Hi', 'Goodbye'] twice. myWords and myOtherWords both point to the same array object. Line 3 is mutating that object by changing the value of the first element.

// Problem 4 ------------------------------------------------------------------

// Line 5 will log ['Hi', 'Bye'] because myWords was reassigned to a new array object.

// Line 6 will log ['Hello', 'Goodbye'], the value myOtherWords was initially assigned to.

// Problem 5 ------------------------------------------------------------------

// Line 5 will log ['Hi', 'Goodbye']. myWords points to an array object that has been mutated on line 3.

// Line 6 will log 'Hello'. myWord points to a string object with a value of 'Hello' and is not affected by line 3.

// Problem 6 ------------------------------------------------------------------

// variable myWords points to an array object with a value of ['Hello', 'Goodbye']. variable myWord points to a string object with a value of 'Hi'. The element at the 0 index of the myWords array is set to a new string object with the same value as myWord ('Hi'). myWord is then reassigned to the string 'Hello'.

// Line 6 logs ['Hi', 'Goodbye']
// Line 7 logs 'Hello'
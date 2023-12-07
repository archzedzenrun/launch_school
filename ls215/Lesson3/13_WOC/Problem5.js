/*
Input: String
Output: String (?)

Questions:
-Will there always be three rails? - YES
-Does this work with any string?  - YES

Implicit:
-Input will be alphabetic chars only
-Input wont be empty
-Only 1 argument will be passed to the function

Rules:

Char gets pushed to rails at index 0

E . . . . . S
. X . . . I . E
. . E . C . . . S
. . . R

['E']
['.', 'X']
['.', '.', 'E']


"HELLO WORLD" - length 10

H . L . O . O . L
. E . L . W . R . D

H . . . O . . . L
. E . L . W . R . D
. . L . . . O

H . . . . . O
. E . . . W . R
. . L . O . . . L
. . . L . . . . . D

[HO]
[EWR]
[LOL]
[LD]



Notes:
HELLOTHEREWORLD
0   4   8   12
every odd index
  2   6   10   14

Examples:

[ES]
[XIE]
[ECS]
[R]

[[EC], [XIE], [ECS], [R]]

0 1 2 3 2 1 0 1 2

index = 0

iterate through characters of input string

push the current character into the sub array at current index

set a toggle to true, true will signify increment

while toggle is true, increment index by 1
otherwise decrement index by 1

if index is equal to the length of the array minus 1
  switch toggle to false

Algorithm:
-Create a rails variable to an empty array
-Populate rails array with as many empty arrays as indicated by the number of rails argument
-Set an index variable to 0
-Set a increment variable to true

-Remove spaces from input string
-Iterate through the chars of the input string
  -Check if index is equal to length of rails array - 1
    -If it is, set increment variable to false
  -Check if index is equal to 0 and the value of increment variable is false
    -If it is, set increment variable to true

  -Push current character to the subarray at the current index in the rails array

  -If increment varible is true
    -Increment index by 1
  -Otherwise decrement index by 1

-Combine all rails sub arrays together to form the output string and return it.

Input: ("EXERCISES", 4)
[]
[[], [], [], []]
index = 0
increment = true
is index equal to 3?
is index equal to 0 and increment is false?

Char gets pushed to rails at index 0
*/

function addEmptyRails(numberOfRails) {
  let rails = [];
  for (let num = 1; num <= numberOfRails; num += 1) {
    rails.push([]);
  }

  return rails;
}

function populateRails(message, rails) {
  let index = 0;
  let increment = true;
  message.split('').forEach(char => {
    if (index === rails.length - 1) {
      increment = false;
    } else if (index === 0) {
      increment = true;
    }

    rails[index].push(char);
    increment ? index += 1 : index -= 1;
  });

  return rails;
}

function railFenceEncoder(message, numberOfRails) {
  if (numberOfRails < 2) {
    return message;
  }

  let rails = addEmptyRails(numberOfRails);
  message = message.replace(/[\s+]/g, '');
  rails = populateRails(message, rails);
  return rails.flat().join('');
}

console.log(railFenceEncoder("WE ARE DISCOVERED FLEE AT ONCE", 3) === 'WECRLTEERDSOEEFEAOCAIVDEN');
console.log(railFenceEncoder('One rail, only one rail', 1));
console.log(railFenceEncoder('XOXOXOXOXOXOXOXOXO', 2));
console.log(railFenceEncoder('EXERCISES', 4))

/*
Decoder Algorithm:
-Populate rails array with empty rails based on number of rails
-Replace all chars of input message with "?"
-Populate the rails array with the "?" message.

-Create an index variable to 0
-Create an unencryptedRails variable to an empty array
-Create a temp array variable to an empty array
-Iterate through the chars of the input string
  -Add char to temp array
  -If temp array size is equal to rails at current index
    -Push temp array to unecryptedRails
    -Increment index by 1
    -Reset temp array to an empty array


Decoder helper function:
-Create an decodedString variable to empty string.
-Set an railsindex variable to 0
-Set a charIndex variable to 0
-Set a increment variable to true

  -While decodedString length is less than the message length
  -Check if railsindex is equal to length of rails array - 1
    -If it is, set increment variable to false
  -Check if railsindex is equal to 0 and the value of increment variable is false
    -If it is, set increment variable to true

  -Push character at character index from the rails array at the current railsindex to decodedString

  -If increment varible is true
    -Increment index by 1
  -Otherwise decrement index by 1

  -Increment charIndex by 1
[['WECRLTE'], ['ERDSOEEFEAOC'], ['AIVDEN']]

*/

function decodeRails(rails, messageSize) {
  let railsIndex = 0;
  let increment = true;
  let decodedString = '';

  while (decodedString.length < messageSize) {
    if (railsIndex === rails.length - 1) {
      increment = false;
    } else if (railsIndex === 0) {
      increment = true;
    }

    decodedString += rails[railsIndex][0];
    rails[railsIndex].splice(0, 1);

    increment ? railsIndex += 1 : railsIndex -= 1;
  }

  return decodedString
}

function railFenceDecoder(encodedMessage, numberOfRails) {
  if (numberOfRails < 2) {
    return encodedMessage;
  }

  let rails = addEmptyRails(numberOfRails);
  questionMarkMessage = encodedMessage.replace(/[A-Z]/ig, '?');
  rails = populateRails(encodedMessage, rails);

  let index = 0;
  let unecryptedRails = [];
  let tempArray = [];
  encodedMessage.split('').forEach(char => {
    tempArray.push(char);
    if (tempArray.length === rails[index].length) {
      unecryptedRails.push(tempArray);
      index += 1;
      tempArray = [];
    }
  });

  return decodeRails(unecryptedRails, encodedMessage.length);
}

console.log(railFenceDecoder('WECRLTEERDSOEEFEAOCAIVDEN', 3) === 'WEAREDISCOVEREDFLEEATONCE');
console.log(railFenceDecoder('ABCDEFGHIJKLMNOP', 1))
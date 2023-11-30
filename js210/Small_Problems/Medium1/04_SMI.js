/*
Register is the current value
Regisetr is not part of the stack
Register is reassigned to the operation performed on the most recent removed value from the stack  and the regsiter value

register = 3
push 3 [3]
register = 4
push 4 [3, 4]
register = 5
push 5 [3, 4, 5]
print register -> 5
ADD pops 5, adds to register, register = 10
[3, 4]
print register -> 10
pop, stack = [3], register = 4
print regsiter -> 4
add, stack = [], register = 7
print register -> 7


Algorithm:
-Split input string at spaces into an array
-Iterate through the array
  -If value is a number 0-9, assign it to the register
  -If value is 'PUSH', add register value to end of stack
  -If value is 'ADD', remove last value of stack, add it to register value and reassign register to the result
    -Same with 'SUB' but subtract
    -Same with 'MULT' but multiply
    -Same with 'DIV' but divide
    -Same with 'REMAINDER' but reassign register to the remainder after division
  -If value is 'POP', remove last item and assign register to the value
  -if value is 'PRINT', print the current register value
*/

function minilang(str) {
  let stack = [];
  let register = 0;

  const NUMBER = new RegExp(/[0-9]/);
  str.split(' ').forEach(command => {
    if (NUMBER.test(command)) {
      command = Number(command);
    }

    if (NUMBER.test(command)) {
      register = command;
    } else if (command === 'PUSH') {
      stack.push(register);
    } else if (command === 'ADD') {
      register += stack.pop();
    } else if (command === 'SUB') {
      register -= stack.pop();
    } else if (command === 'MULT') {
      register *= stack.pop();
    } else if (command === 'DIV') {
      register = Math.floor(register / stack.pop());
    } else if (command === 'REMAINDER') {
      register = Math.floor(register % stack.pop());
    } else if (command === 'POP') {
      register = stack.pop();
    } else if (command === 'PRINT') {
      console.log(register);
    }


  })
}

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 REMAINDER MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` commands)
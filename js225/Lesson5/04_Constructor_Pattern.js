// PP 1
// Constructor functions are capitalized.

// PP 2
// The code will result in an error because Lizard was invoked without using the new operator and the function has no explicit return value. It returns undefined, which we are then trying to invoke the scamper method on.

// PP 3
function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

let lizzy = new Lizard();
lizzy.scamper(); // ?
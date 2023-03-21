=begin
A new instance of the Oracle class is created and set to the local variable
oracle. The instance method .predict_the_future is invoked on oracle.
The predict_the_future method concatenates the string "You will " with
the result of invoking the .sample method on the return value of the choices
method. The choices method returns an array of strings and sample selects
a random element from that array

The result will be one of the following:

"You will eat a nice lunch"
"You will take a nap soon"
"You will stay at work late"
=end
=begin
The local variable trip is set to the instantiation of a new object of the
RoadTrip class. The predict_the_future instance method is invoked on trip.
Ruby first looks for the method in the class that it was called on and doesnt
find it. It then looks in the Class in the next level of the heirarchy which
is the Oracle class. The predict_the_future method in the Oracle class is
then invoked which concatenates the string "You will " with the return
of invoking the .sample method on the return value of invoking the choices
method." Since we are still working with an instance of the RoadTrip class,
again Ruby is going to check for the choices method there first, which it does
find and this is the array that sample is being invoked on in the predict_the_future
method in this case. sample is an array method that returns a random element from
the array it was invoked on.

The result will be one of the following:

"You will visit Vegas"
"You will fly to Fiji"
"You will romp in Rome"
=end
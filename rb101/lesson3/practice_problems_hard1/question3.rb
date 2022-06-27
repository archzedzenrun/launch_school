=begin 
A: "one is: one"
   "two is: two"
   "three is: three"
   
The parameters one, two, and three in the mess_with_vars method definition
are assigned to variables local to that method.  lines 13,14,15 reference
the one,two, and three variables defined on lines 7,8,9

B: "one is: one"
   "two is: two"
   "three is: three"
   
Same thing as A. Lines 13,14,15 are still reference the variables defined
on likes 7,8,9.

C: "one is: two"
   "two is: three"
   "three is: one"

This time the variables defined on lines 7,8,9 are being passed in as 
arguments to the mess_with_vars method and are being modified by the .gsub!
method which does mutate the caller.
=end